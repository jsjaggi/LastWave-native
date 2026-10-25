import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';
part 'track.g.dart';

@freezed
class Track with _$Track {
  const factory Track({
    required String id,
    required String name,
    required String artist,
    required String album,
    required Duration duration,
    required String? coverArtUrl,
    required int trackNumber,
    required int discNumber,
    required bool isLoved,
    required DateTime? lastScrobbled,
    required int playCount,
    required String? url,
    required String? lastFmUrl,
    required int? bitrate,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}

@freezed
class Scrobble with _$Scrobble {
  const factory Scrobble({
    required String trackId,
    required String artistName,
    required String albumName,
    required String trackName,
    required DateTime timestamp,
    required String? status,
  }) = _Scrobble;

  factory Scrobble.fromJson(Map<String, dynamic> json) => _$ScrobbleFromJson(json);
}

@freezed
class TasteProfile with _$TasteProfile {
  const factory TasteProfile({
    required String id,
    required Map<String, double> genreWeights,
    required Map<String, double> artistWeights,
    required Map<String, double> albumWeights,
    required List<String> topGenres,
    required List<String> topArtists,
    required List<String> topAlbums,
  }) = _TasteProfile;

  factory TasteProfile.fromJson(Map<String, dynamic> json) => _$TasteProfileFromJson(json);
}