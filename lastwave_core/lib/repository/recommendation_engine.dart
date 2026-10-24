// Port of RecommendationEngine.kt - Core scoring and parallel source pipeline

import 'dart:async';
import 'dart:math' as math;
import 'package:collection/collection.dart';
import '../models/track.dart';

typedef LastFmCall = Future<Map<String, dynamic>> Function(Map<String, String> params);
typedef ProgressCallback = void Function(String message);
typedef FreshCheck = Future<List<GeneratedTrack>> Function(List<GeneratedTrack> tracks);

const _recoMaxCycles = 5;
const _recoRefillAttempts = 24;
const _recoMaxStalledRounds = 2;
const _recoArtistCap = 2;
const _recoAlbumCap = 2;
const _recoGenreCapRatio = 0.35;

const _recoGenreNeighbors = {
  'indie rock': 'alternative rock',
  'alternative rock': 'indie rock',
  'house': 'deep house',
  'deep house': 'tech house',
  'tech house': 'techno',
  'techno': 'trance',
  'hip hop': 'rap',
  'hip-hop': 'boom bap',
  'rap': 'hip hop',
  'metal': 'heavy metal',
  'heavy metal': 'metal',
  'black metal': 'doom metal',
  'death metal': 'doom metal',
  'pop': 'indie pop',
  'indie pop': 'dream pop',
  'dream pop': 'shoegaze',
  'shoegaze': 'dream pop',
  'jazz': 'soul',
  'soul': 'r&b',
  'r&b': 'neo-soul',
  'funk': 'soul',
  'electronic': 'experimental',
  'ambient': 'chillwave',
  'lo-fi': 'chillwave',
  'chillwave': 'synthwave',
  'punk': 'post-punk',
  'post-punk': 'new wave',
  'new wave': 'synth-pop',
  'folk': 'indie folk',
  'indie folk': 'folk',
  'country': 'folk',
  'trap': 'drill',
  'drill': 'trap',
  'drum and bass': 'jungle',
  'jungle': 'drum and bass',
};

class _Candidate {
  GeneratedTrack track;
  int weight;
  final Set<String> tags;
  bool isPrimaryGenre;

  _Candidate({
    required this.track,
    required this.weight,
    required this.tags,
    this.isPrimaryGenre = false,
  });
}

class _Scored {
  final GeneratedTrack track;
  final int weight;
  final Set<String> tags;
  final bool fresh;
  final bool familiar;
  final double score;

  _Scored({
    required this.track,
    required this.weight,
    required this.tags,
    required this.fresh,
    required this.familiar,
    required this.score,
  });
}

class _RecoContext {
  final int total;
  final TasteProfile profile;
  final Set<String> blacklist;
  final Map<String, _Candidate> pool = {};
  final Set<String> exploredArtists = {};
  final Set<String> exploredTags = {};
  final List<String> pendingArtists = [];

  _RecoContext({
    required this.total,
    required this.profile,
    required this.blacklist,
  });

  void addAll(List<GeneratedTrack> tracks, int weight, String tag, {bool isPrimaryGenre = false}) {
    for (final t in tracks) {
      if (t.name.isEmpty || t.artist.isEmpty) continue;
      final key = t.trackKey;
      if (blacklist.contains(key)) continue;

      final cur = pool[key];
      if (cur != null) {
        if (weight > cur.weight) cur.weight = weight;
        cur.tags.add(tag);
      } else {
        pool[key] = _Candidate(
          track: t,
          weight: weight,
          tags: {tag},
          isPrimaryGenre: isPrimaryGenre,
        );
      }
    }
  }
}

class RecommendationEngine {
  final LastFmCall rawCall;
  final FreshCheck isFresh;
  final ProgressCallback onProgress;
  final math.Random _random = math.Random();

  RecommendationEngine({
    required this.rawCall,
    required this.isFresh,
    required this.onProgress,
  });

  // Scoring logic
  int _gemScore(GeneratedTrack track) {
    final n = track.listeners;
    if (n == null) return 0;
    if (n < 3000) return 4;
    if (n < 10000) return 7;
    if (n < 30000) return 9;
    if (n < 100000) return 6;
    if (n < 400000) return 2;
    if (n < 1500000) return 0;
    return -2;
  }

  int _communityScore(GeneratedTrack track) {
    final listeners = track.listeners;
    final playcount = track.playcount;
    if (listeners == null || playcount == null || listeners == 0) return 0;
    final ratio = playcount / listeners;
    if (ratio >= 6) return 8;
    if (ratio >= 3) return 5;
    if (ratio >= 1.5) return 2;
    return 0;
  }

  int _matchBonus(GeneratedTrack track) =>
      track.match != null ? (track.match! * 34).round() : 0;

  double _recoScore(
    GeneratedTrack track,
    TasteProfile profile,
    int bucketWeight,
    bool isPrimaryGenre,
    int sourceCount,
    bool fresh,
    bool familiar,
  ) {
    var score = 0.0;
    final bw = bucketWeight <= 0 ? 1 : bucketWeight;

    if (bw >= 4) {
      score += 50;
    } else if (bw >= 3) {
      score += 38;
    } else if (bw >= 2) {
      score += 26;
    } else {
      score += 12;
    }

    final artistKey = track.artist.trim().toLowerCase();
    final knownArtist = profile.topArtistNames.contains(artistKey) || profile.recentArtists.contains(artistKey);
    score += (profile.artistAffinity[artistKey] ?? 0.0) * 30.0;
    if (profile.topArtistNames.contains(artistKey)) score += 16;
    if (profile.recentArtists.contains(artistKey)) score += 8;
    if (profile.ytMusicFeedRaw.any((t) => t.trackKey == track.trackKey)) score += 8;
    if (profile.ytMusicLikedRaw.any((t) => t.trackKey == track.trackKey)) score += 6;
    if (profile.ytMusicRecentRaw.any((t) => t.trackKey == track.trackKey)) score += 4;
    if (!knownArtist) score += 3;
    if (isPrimaryGenre) score += 4;

    if (sourceCount >= 3) {
      score += 20;
    } else if (sourceCount == 2) {
      score += 10;
    }

    score += _matchBonus(track);
    score += _gemScore(track);
    score += _communityScore(track);

    score += fresh ? 6 : -20;
    if (familiar) score -= 22;
    score += _random.nextDouble() * 2;

    return score;
  }

  // Candidate sources
  Future<void> _srcSimilarTracks(_RecoContext ctx, int cycle) async {
    final pool = cycle == 1 ? ctx.profile.recentTracksRaw : ctx.profile.topTracksRaw;
    final seeds = <_Seed>[];

    final shuffled = [...pool]..shuffle(_random);
    for (final track in shuffled.skip((cycle - 1) * 3).take(3)) {
      seeds.add(_Seed(track, cycle == 1 ? 4 : 3, cycle == 1 ? 'mood' : 'taste'));
    }

    if (cycle <= 2) {
      final ytPool = [...ctx.profile.ytMusicRecentRaw, ...ctx.profile.ytMusicLikedRaw, ...ctx.profile.ytMusicFeedRaw]
          .toSet()
          .toList();
      final ytFeedKeys = ctx.profile.ytMusicFeedRaw.map((t) => t.trackKey).toSet();

      final ytShuffled = [...ytPool]..shuffle(_random);
      final seed = ytShuffled.skip((cycle - 1) * 2).firstOrNull;
      if (seed != null) {
        seeds.add(_Seed(seed, 3, ytFeedKeys.contains(seed.trackKey) ? 'yt-feed-similar' : 'yt-taste'));
      }
    }

    final uniqueSeeds = {for (var s in seeds) s.track.trackKey: s}.values.toList();

    await Future.wait(uniqueSeeds.map((s) async {
      if (s.track.name.isNotEmpty && s.track.artist.isNotEmpty) {
        try {
          final data = await rawCall({
            'method': 'track.getsimilar',
            'track': s.track.name,
            'artist': s.track.artist,
            'limit': '30',
          });
          final tracks = data.parseTrackList(['similartracks']);
          if (tracks.isNotEmpty) {
            ctx.addAll(tracks, s.weight, s.source);
          }
        } catch (e) {
          // Log or ignore
        }
      }
    }));
  }

  Future<void> _srcSimilarArtists(_RecoContext ctx, int cycle) async {
    final artists = ctx.profile.topArtistsRaw
        .toSet()
        .toList()
      ..sort((a, b) => (ctx.profile.artistAffinity[b.trim().toLowerCase()] ?? 0.0)
          .compareTo(ctx.profile.artistAffinity[a.trim().toLowerCase()] ?? 0.0));

    final batch = artists.skip((cycle - 1) * 3).take(3).toList();

    await Future.wait(batch.map((artistName) async {
      try {
        final data = await rawCall({
          'method': 'artist.getsimilar',
          'artist': artistName,
          'limit': '20',
        });
        final sims = data.parseArtistNames(['similarartists'])..shuffle(_random);
        for (final sa in sims.take(5)) {
          final ak = sa.trim().toLowerCase();
          if (ctx.exploredArtists.contains(ak)) continue;
          ctx.exploredArtists.add(ak);
          ctx.pendingArtists.add(sa);
        }
      } catch (e) {
        // Ignore
      }
    }));
  }

  Future<void> _srcArtistTopTracks(_RecoContext ctx) async {
    final batch = ctx.pendingArtists.take(4).toList();
    for (var i = 0; i < batch.length; i++) {
      ctx.pendingArtists.removeAt(0);
    }

    await Future.wait(batch.map((artistName) async {
      try {
        final page = (_random.nextDouble() * 6).ceil().toInt().clamp(1, 6);
        final data = await rawCall({
          'method': 'artist.gettoptracks',
          'artist': artistName,
          'limit': '10',
          'page': page.toString(),
        });
        final tracks = data.parseTrackList(['toptracks']);
        if (tracks.isNotEmpty) {
          ctx.addAll(tracks, 2, 'artist:${artistName.trim().toLowerCase()}');
        }
      } catch (e) {
        // Ignore
      }
    }));
  }

  Future<void> _srcGenreMatches(_RecoContext ctx, int cycle) async {
    final tags = ctx.profile.topTags.toList()..shuffle(_random);
    final batch = tags.skip((cycle - 1) * 4).take(4).toList();

    for (final tag in batch) {
      ctx.exploredTags.add(tag);
    }

    final limit = (ctx.total * 0.4).ceil().toInt().clamp(1, 100);

    await Future.wait(batch.map((tag) async {
      try {
        final page = (_random.nextDouble() * 10).toInt() + 2;
        final data = await rawCall({
          'method': 'tag.gettoptracks',
          'tag': tag,
          'limit': limit.toString(),
          'page': page.toString(),
        });
        final tracks = data.parseTrackList(['tracks']);
        if (tracks.isNotEmpty) {
          ctx.addAll(tracks, 1, 'tag:$tag', isPrimaryGenre: true);
        }
      } catch (e) {
        // Ignore
      }
    }));
  }

  Future<void> _srcTagMatches(_RecoContext ctx) async {
    final neighbors = ctx.exploredTags.map((t) => _recoGenreNeighbors[t]).whereNotNull().toSet();
    final unique = neighbors.where((t) => !ctx.exploredTags.contains(t)).take(4).toList();

    for (final tag in unique) {
      ctx.exploredTags.add(tag);
    }

    final limit = (ctx.total * 0.3).ceil().toInt().clamp(1, 100);

    await Future.wait(unique.map((tag) async {
      try {
        final page = (_random.nextDouble() * 6).toInt() + 1;
        final data = await rawCall({
          'method': 'tag.gettoptracks',
          'tag': tag,
          'limit': limit.toString(),
          'page': page.toString(),
        });
        final tracks = data.parseTrackList(['tracks']);
        if (tracks.isNotEmpty) {
          ctx.addAll(tracks, 1, 'tag:$tag', isPrimaryGenre: false);
        }
      } catch (e) {
        // Ignore
      }
    }));
  }

  Future<void> _srcRelatedArtists(_RecoContext ctx) async {
    final seeds = ctx.exploredArtists.toList()..shuffle(_random);
    final batch = seeds.take(4).toList();

    await Future.wait(batch.map((artistName) async {
      try {
        final data = await rawCall({
          'method': 'artist.getsimilar',
          'artist': artistName,
          'limit': '15',
        });
        final sims = data.parseArtistNames(['similarartists'])..shuffle(_random);
        for (final sa in sims) {
          final ak = sa.trim().toLowerCase();
          if (ctx.exploredArtists.contains(ak)) continue;
          ctx.exploredArtists.add(ak);
          ctx.pendingArtists.add(sa);
        }
      } catch (e) {
        // Ignore
      }
    }));

    await _srcArtistTopTracks(ctx);
  }

  Future<void> _srcDiscoveryPool(_RecoContext ctx) async {
    final wide = ctx.profile.topArtistsRaw
        .toSet()
        .toList()
      ..sort((a, b) => (ctx.profile.artistAffinity[b.trim().toLowerCase()] ?? 0.0)
          .compareTo(ctx.profile.artistAffinity[a.trim().toLowerCase()] ?? 0.0));

    final batch = wide.take(8).toList()..shuffle(_random);
    final selected = batch.take(3).toList();

    await Future.wait(selected.map((artistName) async {
      try {
        final page = (_random.nextDouble() * 8).ceil().toInt().clamp(1, 8);
        final data = await rawCall({
          'method': 'artist.gettoptracks',
          'artist': artistName,
          'limit': '15',
          'page': page.toString(),
        });
        final tracks = data.parseTrackList(['toptracks']);
        if (tracks.isNotEmpty) {
          ctx.addAll(tracks, 2, 'artist:${artistName.trim().toLowerCase()}');
        }
      } catch (e) {
        // Ignore
      }
    }));
  }

  Future<void> _srcFreshRefill(_RecoContext ctx, int attempt) async {
    final limit = (ctx.total * 2).clamp(50, 200).toString();
    final tags = ctx.profile.topTags.toList();
    final tag = tags.isEmpty ? null : tags[_random.nextInt(tags.length)];

    final artists = ctx.profile.topArtistsRaw
        .toSet()
        .toList()
      ..sort((a, b) => (ctx.profile.artistAffinity[b.trim().toLowerCase()] ?? 0.0)
          .compareTo(ctx.profile.artistAffinity[a.trim().toLowerCase()] ?? 0.0));

    final topArtists = artists.take(12).toList();
    final artist = topArtists.isEmpty ? null : topArtists[_random.nextInt(topArtists.length)];

    final useTag = tag != null && (attempt % 2 == 0 || artist == null);

    if (useTag) {
      try {
        final page = 2 + ((attempt * 7) % 48);
        final data = await rawCall({
          'method': 'tag.gettoptracks',
          'tag': tag,
          'limit': limit,
          'page': page.toString(),
        });
        ctx.addAll(data.parseTrackList(['tracks']), 1, 'tag:$tag', isPrimaryGenre: true);
      } catch (e) {
        // Ignore
      }
      return;
    }

    if (artist != null) {
      try {
        final similarData = await rawCall({
          'method': 'artist.getsimilar',
          'artist': artist,
          'limit': '30',
        });
        final sims = similarData.parseArtistNames(['similarartists'])..shuffle(_random);
        final candidateArtist = sims.firstOrNull;
        if (candidateArtist != null) {
          final page = 1 + ((attempt * 5) % 12);
          final data = await rawCall({
            'method': 'artist.gettoptracks',
            'artist': candidateArtist,
            'limit': limit,
            'page': page.toString(),
          });
          ctx.addAll(data.parseTrackList(['toptracks']), 2, 'artist:${candidateArtist.trim().toLowerCase()}');
        }
      } catch (e) {
        // Ignore
      }
    }
  }

  // Selection logic
  List<GeneratedTrack> _selectFinal(List<_Scored> scored, int total) {
    final genreCap = (total * _recoGenreCapRatio).ceil().toInt().clamp(2, total);

    List<GeneratedTrack> attempt({
      required int artistCap,
      required bool albumCapOn,
      required bool genreCapOn,
      required bool freshOnly,
      required int familiarCap,
    }) {
      final artistCount = <String, int>{};
      final albumCount = <String, int>{};
      final genreCount = <String, int>{};
      final pickedKeys = <String>{};
      final picked = <GeneratedTrack>[];
      var familiarCount = 0;

      for (final c in scored) {
        final key = c.track.trackKey;
        if (pickedKeys.contains(key)) continue;
        if (freshOnly && !c.fresh) continue;
        if (c.familiar && familiarCount >= familiarCap) continue;

        final ak = c.track.artist.trim().toLowerCase();
        if ((artistCount[ak] ?? 0) >= artistCap) continue;

        final album = c.track.album;
        if (albumCapOn && album != null && album.isNotEmpty) {
          final alk = album.toLowerCase();
          if ((albumCount[alk] ?? 0) >= _recoAlbumCap) continue;
        }

        if (genreCapOn) {
          final genreTag = c.tags.firstWhereOrNull((t) => t.startsWith('tag:'));
          if (genreTag != null) {
            if ((genreCount[genreTag] ?? 0) >= genreCap) continue;
            genreCount[genreTag] = (genreCount[genreTag] ?? 0) + 1;
          }
        }

        artistCount[ak] = (artistCount[ak] ?? 0) + 1;
        if (album != null && album.isNotEmpty) {
          albumCount[album.toLowerCase()] = (albumCount[album.toLowerCase()] ?? 0) + 1;
        }

        pickedKeys.add(key);
        picked.add(c.track);
        if (c.familiar) familiarCount++;
        if (picked.length >= total) break;
      }
      return picked;
    }

    final familiarCap = (total / 6).ceil().toInt().clamp(1, total);
    var result = attempt(artistCap: _recoArtistCap, albumCapOn: true, genreCapOn: true, freshOnly: true, familiarCap: familiarCap);
    if (result.length < total) result = attempt(artistCap: 3, albumCapOn: true, genreCapOn: true, freshOnly: true, familiarCap: familiarCap);
    if (result.length < total) result = attempt(artistCap: 3, albumCapOn: true, genreCapOn: false, freshOnly: true, familiarCap: familiarCap);
    if (result.length < total) result = attempt(artistCap: 3, albumCapOn: false, genreCapOn: false, freshOnly: true, familiarCap: familiarCap);
    if (result.length < total) result = attempt(artistCap: 99, albumCapOn: false, genreCapOn: false, freshOnly: true, familiarCap: familiarCap);
    if (result.length < total) result = attempt(artistCap: 99, albumCapOn: false, genreCapOn: false, freshOnly: true, familiarCap: (total / 3).ceil().toInt().clamp(familiarCap, total));
    if (result.length < total) result = attempt(artistCap: 99, albumCapOn: false, genreCapOn: false, freshOnly: true, familiarCap: total);

    return result;
  }

  List<GeneratedTrack> _interleave(List<GeneratedTrack> tracks, Map<String, Set<String>> tagsByKey) {
    final buckets = <String, List<GeneratedTrack>>{};
    for (final t in tracks) {
      final tags = tagsByKey[t.trackKey];
      final genreTag = tags?.firstWhereOrNull((t) => t.startsWith('tag:'));
      final label = genreTag ?? 'other';
      buckets.putIfAbsent(label, () => []).add(t);
    }

    final labels = buckets.keys.toList();
    final out = <GeneratedTrack>[];
    String? lastLabel;

    while (out.length < tracks.length) {
      var pickedIdx = labels.indexWhere((l) => buckets[l]!.isNotEmpty && l != lastLabel);
      if (pickedIdx == -1) pickedIdx = labels.indexWhere((l) => buckets[l]!.isNotEmpty);
      if (pickedIdx == -1) break;

      final label = labels[pickedIdx];
      final track = buckets[label]!.removeAt(0);
      out.add(track);
      lastLabel = label;
    }
    return out;
  }

  // Main entry point
  Future<List<GeneratedTrack>> run({
    required int total,
    required TasteProfile profile,
    required Set<String> blacklist,
    Set<String> familiarKeys = const {},
    List<GeneratedTrack> youtubeCandidates = const [],
  }) async {
    onProgress('Reading your listening mood…');
    final ctx = _RecoContext(total: total, profile: profile, blacklist: blacklist);

    ctx.addAll(profile.ytMusicFeedRaw.take(40).toList(), 4, 'yt-feed');
    if (youtubeCandidates.isNotEmpty) {
      ctx.addAll(youtubeCandidates.take(60).toList(), 4, 'yt-radio');
    }

    var cycle = 1;
    var stalledCycles = 0;

    while (cycle <= _recoMaxCycles && (cycle == 1 || ctx.pool.length < total)) {
      final poolSizeBefore = ctx.pool.length;
      onProgress(cycle == 1 ? 'Reading your listening mood…' : 'Digging deeper for more discoveries (round $cycle)…');

      await _srcSimilarTracks(ctx, cycle);
      if (ctx.pool.length < total) {
        await _srcSimilarArtists(ctx, cycle);
        await _srcArtistTopTracks(ctx);
      }
      if (ctx.pool.length < total) await _srcGenreMatches(ctx, cycle);
      if (ctx.pool.length < total) await _srcTagMatches(ctx);
      if (ctx.pool.length < total) await _srcRelatedArtists(ctx);
      if (ctx.pool.length < total) await _srcDiscoveryPool(ctx);

      stalledCycles = ctx.pool.length == poolSizeBefore ? stalledCycles + 1 : 0;
      if (stalledCycles >= _recoMaxStalledRounds) break;
      cycle++;
    }

    var refillAttempt = 0;
    var stalledRefills = 0;
    while (ctx.pool.length < total && refillAttempt < _recoRefillAttempts) {
      final poolSizeBefore = ctx.pool.length;
      onProgress('Finding fresh tracks… ${ctx.pool.length}/$total');
      await _srcFreshRefill(ctx, refillAttempt);
      stalledRefills = ctx.pool.length == poolSizeBefore ? stalledRefills + 1 : 0;
      if (stalledRefills >= _recoMaxStalledRounds) break;
      refillAttempt++;
    }

    onProgress('Curating your personal recommendations…');

    final allCandidateTracks = ctx.pool.values.map((c) => c.track).toList();
    final freshTracks = await isFresh(allCandidateTracks);
    final freshKeysFinal = freshTracks.map((t) => t.trackKey).toSet();

    final scored = ctx.pool.values.map((c) {
      final isFresh = freshKeysFinal.contains(c.track.trackKey);
      final isFamiliar = familiarKeys.contains(c.track.trackKey);
      return _Scored(
        track: c.track,
        weight: c.weight,
        tags: c.tags,
        fresh: isFresh,
        familiar: isFamiliar,
        score: _recoScore(c.track, profile, c.weight, c.isPrimaryGenre, c.tags.length, isFresh, isFamiliar),
      );
    }).toList()
      ..sort((a, b) {
        if (a.fresh != b.fresh) return a.fresh ? -1 : 1;
        return b.score.compareTo(a.score);
      });

    var finalTracks = _selectFinal(scored, total);

    // Dedup + cap
    final seen = <String>{};
    finalTracks = finalTracks.where((t) => seen.add(t.trackKey)).take(total).toList();

    final tagsByKey = {for (var s in scored) s.track.trackKey: s.tags};
    finalTracks = _interleave(finalTracks, tagsByKey);

    // Playlist flow: strongest track opens, second-strongest closes
    if (finalTracks.length >= 3) {
      final scoreByKey = {for (var s in scored) s.track.trackKey: s.score};
      final order = [...finalTracks]..sort((a, b) => (scoreByKey[b.trackKey] ?? 0.0).compareTo(scoreByKey[a.trackKey] ?? 0.0));
      final opener = order[0];
      final closer = order.firstWhere((t) => t.trackKey != opener.trackKey, orElse: () => order[1]);

      final mid = finalTracks.where((t) => t.trackKey != opener.trackKey && t.trackKey != closer.trackKey).toList();
      finalTracks = [opener, ...mid, closer];
    }

    return finalTracks;
  }
}

class _Seed {
  final GeneratedTrack track;
  final int weight;
  final String source;
  _Seed(this.track, this.weight, this.source);
}

/// User taste profile for recommendations
class TasteProfile {
  final Set<String> topArtistNames;
  final Set<String> recentArtists;
  final Map<String, double> artistAffinity;
  final List<GeneratedTrack> ytMusicFeedRaw;
  final List<GeneratedTrack> ytMusicLikedRaw;
  final List<GeneratedTrack> ytMusicRecentRaw;
  final List<GeneratedTrack> recentTracksRaw;
  final List<GeneratedTrack> topTracksRaw;
  final List<String> topArtistsRaw;
  final Set<String> topTags;

  TasteProfile({
    required this.topArtistNames,
    required this.recentArtists,
    required this.artistAffinity,
    required this.ytMusicFeedRaw,
    required this.ytMusicLikedRaw,
    required this.ytMusicRecentRaw,
    required this.recentTracksRaw,
    required this.topTracksRaw,
    required this.topArtistsRaw,
    required this.topTags,
  });
}