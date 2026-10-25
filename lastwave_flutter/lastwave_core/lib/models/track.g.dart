// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Track _$TrackFromJson(Map<String, dynamic> json) => _Track(
  id: json['id'] as String,
  name: json['name'] as String,
  artist: json['artist'] as String,
  album: json['album'] as String,
  duration: Duration(microseconds: (json['duration'] as num).toInt()),
  coverArtUrl: json['coverArtUrl'] as String?,
  trackNumber: (json['trackNumber'] as num).toInt(),
  discNumber: (json['discNumber'] as num).toInt(),
  isLoved: json['isLoved'] as bool,
  lastScrobbled: json['lastScrobbled'] == null
      ? null
      : DateTime.parse(json['lastScrobbled'] as String),
  playCount: (json['playCount'] as num).toInt(),
  url: json['url'] as String?,
  lastFmUrl: json['lastFmUrl'] as String?,
  bitrate: (json['bitrate'] as num?)?.toInt(),
);

Map<String, dynamic> _$TrackToJson(_Track instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'artist': instance.artist,
  'album': instance.album,
  'duration': instance.duration.inMicroseconds,
  'coverArtUrl': instance.coverArtUrl,
  'trackNumber': instance.trackNumber,
  'discNumber': instance.discNumber,
  'isLoved': instance.isLoved,
  'lastScrobbled': instance.lastScrobbled?.toIso8601String(),
  'playCount': instance.playCount,
  'url': instance.url,
  'lastFmUrl': instance.lastFmUrl,
  'bitrate': instance.bitrate,
};

_Scrobble _$ScrobbleFromJson(Map<String, dynamic> json) => _Scrobble(
  trackId: json['trackId'] as String,
  artistName: json['artistName'] as String,
  albumName: json['albumName'] as String,
  trackName: json['trackName'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  status: json['status'] as String?,
);

Map<String, dynamic> _$ScrobbleToJson(_Scrobble instance) => <String, dynamic>{
  'trackId': instance.trackId,
  'artistName': instance.artistName,
  'albumName': instance.albumName,
  'trackName': instance.trackName,
  'timestamp': instance.timestamp.toIso8601String(),
  'status': instance.status,
};

_TasteProfile _$TasteProfileFromJson(Map<String, dynamic> json) =>
    _TasteProfile(
      id: json['id'] as String,
      genreWeights: (json['genreWeights'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      artistWeights: (json['artistWeights'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      albumWeights: (json['albumWeights'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      topGenres: (json['topGenres'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      topArtists: (json['topArtists'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      topAlbums: (json['topAlbums'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TasteProfileToJson(_TasteProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'genreWeights': instance.genreWeights,
      'artistWeights': instance.artistWeights,
      'albumWeights': instance.albumWeights,
      'topGenres': instance.topGenres,
      'topArtists': instance.topArtists,
      'topAlbums': instance.topAlbums,
    };
