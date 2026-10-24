// Port of TrackModels.kt - Last.fm DTOs and core track models
// Generated with freezed for immutable data classes and JSON serialization

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'track.freezed.dart';
part 'track.g.dart';

/// Image DTO from Last.fm (multiple sizes)
@freezed
abstract class ImageDto with _$ImageDto {
  const factory ImageDto({
    @JsonKey(name: '#text') @Default('') String url,
    @Default('') String size,
  }) = _ImageDto;

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);
}

/// Track attribute (nowplaying flag)
@freezed
abstract class TrackAttr with _$TrackAttr {
  const factory TrackAttr({
    @Default('') String nowplaying,
  }) = _TrackAttr;

  factory TrackAttr.fromJson(Map<String, dynamic> json) =>
      _$TrackAttrFromJson(json);
}

/// Artist reference from Last.fm
@freezed
abstract class ArtistRef with _$ArtistRef {
  const factory ArtistRef({
    @JsonKey(name: '#text') @Default('') String textName,
    @Default('') String name,
    @Default('') String mbid,
  }) = _ArtistRef;

  factory ArtistRef.fromJson(Map<String, dynamic> json) =>
      _$ArtistRefFromJson;

  /// Display name falls back to textName
  String get displayName => name.isNotEmpty ? name : textName;
}

/// Date reference with UTS timestamp
@freezed
abstract class DateRef with _$DateRef {
  const factory DateRef({
    @Default('') String uts,
    @JsonKey(name: '#text') @Default('') String text,
  }) = _DateRef;

  factory DateRef.fromJson(Map<String, dynamic> json) =>
      _$DateRefFromJson(json);
}

/// Recent track from Last.fm user.getrecenttracks
@freezed
abstract class RecentTrack with _$RecentTrack {
  const factory RecentTrack({
    @Default('') String name,
    @Default(ArtistRef()) ArtistRef artist,
    @Default(ArtistRef()) ArtistRef album,
    @Default([]) List<ImageDto> image,
    @Default('') String url,
    DateRef? date,
    @JsonKey(name: '@attr') TrackAttr? attr,
  }) = _RecentTrack;

  factory RecentTrack.fromJson(Map<String, dynamic> json) =>
      _$RecentTrackFromJson(json);

  /// Whether this track is currently playing
  bool get isNowPlaying => attr?.nowplaying == 'true';

  /// Best artwork URL using same logic as ArtworkNormalizer.bestImageUrl
  String? get artworkUrl {
    if (image.isEmpty) return null;
    const priority = ['extralarge', 'large', 'medium', 'small'];
    for (final size in priority) {
      final match = image.firstWhere(
        (img) => img.size == size && _isValidArtwork(img.url),
        orElse: () => ImageDto(),
      );
      if (match.url.isNotEmpty) return match.url;
    }
    // Fallback: first non-placeholder
    final fallback = image.firstWhere(
      (img) => _isValidArtwork(img.url),
      orElse: () => ImageDto(),
    );
    return fallback.url.isNotEmpty ? fallback.url : null;
  }

  static bool _isValidArtwork(String url) {
    if (url.isEmpty) return false;
    final lower = url.toLowerCase();
    // Filter out Last.fm placeholder images
    return !lower.contains('noimage') &&
        !lower.contains('placeholder') &&
        !lower.contains('2a96cbd8b46e442fc41c2b86b821562f');
  }
}

/// Wrapper for track list (handles both single object and array)
@freezed
abstract class RecentTracksList with _$RecentTracksList {
  const factory RecentTracksList({
    @Default([]) List<RecentTrack> tracks,
  }) = _RecentTracksList;

  factory RecentTracksList.fromJson(Map<String, dynamic> json) =>
      _$RecentTracksListFromJson(json);
}

/// Attributes for recent tracks pagination
@freezed
abstract class RecentTracksAttr with _$RecentTracksAttr {
  const factory RecentTracksAttr({
    @Default('0') String total,
    @Default('1') String page,
    @Default('1') String totalPages,
  }) = _RecentTracksAttr;

  factory RecentTracksAttr.fromJson(Map<String, dynamic> json) =>
      _$RecentTracksAttrFromJson(json);
}

/// Body of recent tracks response
@freezed
abstract class RecentTracksBody with _$RecentTracksBody {
  const factory RecentTracksBody({
    @Default(RecentTracksList()) RecentTracksList track,
    @JsonKey(name: '@attr') @Default(RecentTracksAttr()) RecentTracksAttr attr,
  }) = _RecentTracksBody;

  factory RecentTracksBody.fromJson(Map<String, dynamic> json) =>
      _$RecentTracksBodyFromJson(json);
}

/// Full envelope for recent tracks
@freezed
abstract class RecentTracksEnvelope with _$RecentTracksEnvelope {
  const factory RecentTracksEnvelope({
    RecentTracksBody? recenttracks,
    int? error,
    String? message,
  }) = _RecentTracksEnvelope;

  factory RecentTracksEnvelope.fromJson(Map<String, dynamic> json) =>
      _$RecentTracksEnvelopeFromJson(json);

  bool get hasError => error != null;
  String get errorMessage => message ?? 'Unknown error';
}

/// Top track entry with playcount
@freezed
abstract class TopTrackEntry with _$TopTrackEntry {
  const factory TopTrackEntry({
    @Default('') String name,
    @Default(ArtistRef()) ArtistRef artist,
    @Default([]) List<ImageDto> image,
    @Default('') String url,
    @Default('0') String playcount,
  }) = _TopTrackEntry;

  factory TopTrackEntry.fromJson(Map<String, dynamic> json) =>
      _$TopTrackEntryFromJson(json);

  int get playCount => int.tryParse(playcount) ?? 0;

  String? get artworkUrl {
    if (image.isEmpty) return null;
    const priority = ['extralarge', 'large', 'medium', 'small'];
    for (final size in priority) {
      final match = image.firstWhere(
        (img) => img.size == size && _isValidArtwork(img.url),
        orElse: () => ImageDto(),
      );
      if (match.url.isNotEmpty) return match.url;
    }
    final fallback = image.firstWhere(
      (img) => _isValidArtwork(img.url),
      orElse: () => ImageDto(),
    );
    return fallback.url.isNotEmpty ? fallback.url : null;
  }

  static bool _isValidArtwork(String url) {
    if (url.isEmpty) return false;
    final lower = url.toLowerCase();
    return !lower.contains('noimage') &&
        !lower.contains('placeholder') &&
        !lower.contains('2a96cbd8b46e442fc41c2b86b821562f');
  }
}

/// Top track list (handles single/array)
@freezed
abstract class TopTrackList with _$TopTrackList {
  const factory TopTrackList({
    @Default([]) List<TopTrackEntry> tracks,
  }) = _TopTrackList;

  factory TopTrackList.fromJson(Map<String, dynamic> json) =>
      _$TopTrackListFromJson(json);
}

/// Body for toptracks
@freezed
abstract class TopTracksFullBody with _$TopTracksFullBody {
  const factory TopTracksFullBody({
    @Default(TopTrackList()) TopTrackList track,
    @JsonKey(name: '@attr') @Default(StatTotalAttr()) StatTotalAttr attr,
  }) = _TopTracksFullBody;

  factory TopTracksFullBody.fromJson(Map<String, dynamic> json) =>
      _$TopTracksFullBodyFromJson(json);
}

/// Full envelope for top tracks
@freezed
abstract class TopTracksFullEnvelope with _$TopTracksFullEnvelope {
  const factory TopTracksFullEnvelope({
    TopTracksFullBody? toptracks,
    int? error,
    String? message,
  }) = _TopTracksFullEnvelope;

  factory TopTracksFullEnvelope.fromJson(Map<String, dynamic> json) =>
      _$TopTracksFullEnvelopeFromJson(json);
}

/// Stat total attribute
@freezed
abstract class StatTotalAttr with _$StatTotalAttr {
  const factory StatTotalAttr({
    @Default('0') String total,
  }) = _StatTotalAttr;

  factory StatTotalAttr.fromJson(Map<String, dynamic> json) =>
      _$StatTotalAttrFromJson(json);
}

/// User info for scrobble count
@freezed
abstract class UserInfoUser with _$UserInfoUser {
  const factory UserInfoUser({
    @Default('0') String playcount,
    @Default([]) List<ImageDto> image,
  }) = _UserInfoUser;

  factory UserInfoUser.fromJson(Map<String, dynamic> json) =>
      _$UserInfoUserFromJson(json);
}

@freezed
abstract class UserInfoEnvelope with _$UserInfoEnvelope {
  const factory UserInfoEnvelope({
    UserInfoUser? user,
    int? error,
    String? message,
  }) = _UserInfoEnvelope;

  factory UserInfoEnvelope.fromJson(Map<String, dynamic> json) =>
      _$UserInfoEnvelopeFromJson(json);
}

/// Friend entry from Last.fm
@freezed
abstract class FriendEntry with _$FriendEntry {
  const factory FriendEntry({
    @Default('') String name,
    @Default('') String realname,
    @Default([]) List<ImageDto> image,
  }) = _FriendEntry;

  factory FriendEntry.fromJson(Map<String, dynamic> json) =>
      _$FriendEntryFromJson(json);

  String get displayName => realname.isNotEmpty ? realname : name;

  String? get avatarUrl {
    if (image.isEmpty) return null;
    const priority = ['extralarge', 'large', 'medium', 'small'];
    for (final size in priority) {
      final match = image.firstWhere(
        (img) => img.size == size && _isValidArtwork(img.url),
        orElse: () => ImageDto(),
      );
      if (match.url.isNotEmpty) return match.url;
    }
    final fallback = image.firstWhere(
      (img) => _isValidArtwork(img.url),
      orElse: () => ImageDto(),
    );
    return fallback.url.isNotEmpty ? fallback.url : null;
  }

  static bool _isValidArtwork(String url) {
    if (url.isEmpty) return false;
    final lower = url.toLowerCase();
    return !lower.contains('noimage') &&
        !lower.contains('placeholder') &&
        !lower.contains('2a96cbd8b46e442fc41c2b86b821562f');
  }
}

/// Friends list DTO
@freezed
abstract class FriendsListDto with _$FriendsListDto {
  const factory FriendsListDto({
    @JsonKey(name: 'user') @Default([]) List<FriendEntry> user,
  }) = _FriendsListDto;

  factory FriendsListDto.fromJson(Map<String, dynamic> json) =>
      _$FriendsListDtoFromJson(json);
}

@freezed
abstract class FriendsEnvelope with _$FriendsEnvelope {
  const factory FriendsEnvelope({
    FriendsListDto? friends,
    int? error,
    String? message,
  }) = _FriendsEnvelope;

  factory FriendsEnvelope.fromJson(Map<String, dynamic> json) =>
      _$FriendsEnvelopeFromJson(json);
}

/// Track info for artwork fallback
@freezed
abstract class TrackInfoAlbum with _$TrackInfoAlbum {
  const factory TrackInfoAlbum({
    @Default([]) List<ImageDto> image,
  }) = _TrackInfoAlbum;

  factory TrackInfoAlbum.fromJson(Map<String, dynamic> json) =>
      _$TrackInfoAlbumFromJson(json);
}

@freezed
abstract class TrackInfoDetail with _$TrackInfoDetail {
  const factory TrackInfoDetail({
    @Default([]) List<ImageDto> image,
    TrackInfoAlbum? album,
  }) = _TrackInfoDetail;

  factory TrackInfoDetail.fromJson(Map<String, dynamic> json) =>
      _$TrackInfoDetailFromJson(json);
}

@freezed
abstract class TrackInfoEnvelope with _$TrackInfoEnvelope {
  const factory TrackInfoEnvelope({
    TrackInfoDetail? track,
    int? error,
    String? message,
  }) = _TrackInfoEnvelope;

  factory TrackInfoEnvelope.fromJson(Map<String, dynamic> json) =>
      _$TrackInfoEnvelopeFromJson(json);
}

/// Stable track key for deduplication: "artist|track" (lowercase)
@freezed
abstract class TrackKey with _$TrackKey {
  const factory TrackKey({
    required String artist,
    required String track,
  }) = _TrackKey;

  factory TrackKey.fromJson(Map<String, dynamic> json) =>
      _$TrackKeyFromJson(json);

  /// Create from artist and track names
  factory TrackKey.create(String artist, String track) =>
      TrackKey(artist: artist.toLowerCase().trim(), track: track.toLowerCase().trim());

  @override
  String toString() => '$artist|$track';
}

/// Generated track for recommendations (extends track with metadata)
@freezed
abstract class GeneratedTrack with _$GeneratedTrack {
  const factory GeneratedTrack({
    required String name,
    required String artist,
    String? album,
    String? url,
    @Default([]) List<ImageDto> image,
    @Default(0) int? listeners,
    @Default(0) int? playcount,
    @Default(0) int? match,
    String? mbid,
    String? key,
    String? videoId,
    String? source,
    double? weight,
    List<String>? tags,
  }) = _GeneratedTrack;

  factory GeneratedTrack.fromJson(Map<String, dynamic> json) =>
      _$GeneratedTrackFromJson(json);

  /// Stable key for deduplication
  String get trackKey => key ?? TrackKey.create(artist, name).toString();

  /// Best artwork URL
  String? get artworkUrl {
    if (image.isEmpty) return null;
    const priority = ['extralarge', 'large', 'medium', 'small'];
    for (final size in priority) {
      final match = image.firstWhere(
        (img) => img.size == size && _isValidArtwork(img.url),
        orElse: () => ImageDto(),
      );
      if (match.url.isNotEmpty) return match.url;
    }
    final fallback = image.firstWhere(
      (img) => _isValidArtwork(img.url),
      orElse: () => ImageDto(),
    );
    return fallback.url.isNotEmpty ? fallback.url : null;
  }

  static bool _isValidArtwork(String url) {
    if (url.isEmpty) return false;
    final lower = url.toLowerCase();
    return !lower.contains('noimage') &&
        !lower.contains('placeholder') &&
        !lower.contains('2a96cbd8b46e442fc41c2b86b821562f');
  }

  /// Create from RecentTrack
  factory GeneratedTrack.fromRecentTrack(RecentTrack track) => GeneratedTrack(
        name: track.name,
        artist: track.artist.displayName,
        album: track.album.displayName,
        url: track.url,
        image: track.image,
        key: TrackKey.create(track.artist.displayName, track.name).toString(),
      );

  /// Create from TopTrackEntry
  factory GeneratedTrack.fromTopTrack(TopTrackEntry track) => GeneratedTrack(
        name: track.name,
        artist: track.artist.displayName,
        url: track.url,
        image: track.image,
        playcount: track.playCount,
        listeners: 0,
        key: TrackKey.create(track.artist.displayName, track.name).toString(),
      );
}

/// Extension for JSON parsing helpers
extension JsonElementX on Map<String, dynamic> {
  /// Navigate nested JSON path
  dynamic getAtPath(List<String> path) {
    dynamic current = this;
    for (final key in path) {
      if (current is Map<String, dynamic>) {
        current = current[key];
      } else {
        return null;
      }
    }
    return current;
  }

  /// Extract track list from various Last.fm response shapes
  List<GeneratedTrack> parseTrackList(List<String> path) {
    final element = getAtPath(path);
    if (element == null) return [];

    // Handle array
    if (element is List) {
      return element
          .whereType<Map<String, dynamic>>()
          .map(GeneratedTrack.fromJson)
          .toList();
    }

    // Handle object with 'track' key
    if (element is Map<String, dynamic>) {
      final trackField = element['track'];
      if (trackField is List) {
        return trackField
            .whereType<Map<String, dynamic>>()
            .map(GeneratedTrack.fromJson)
            .toList();
      }
      if (trackField is Map<String, dynamic>) {
        return [GeneratedTrack.fromJson(trackField)];
      }
    }

    return [];
  }

  /// Extract artist names from similarartists/artist array
  List<String> parseArtistNames(List<String> path) {
    final element = getAtPath(path);
    if (element == null) return [];

    if (element is List) {
      return element
          .whereType<Map<String, dynamic>>()
          .map((e) => e['name']?.toString() ?? '')
          .where((s) => s.isNotEmpty)
          .toList();
    }
    if (element is Map<String, dynamic>) {
      final artistField = element['artist'];
      if (artistField is List) {
        return artistField
            .whereType<Map<String, dynamic>>()
            .map((e) => e['name']?.toString() ?? '')
            .where((s) => s.isNotEmpty)
            .toList();
      }
      if (artistField is Map<String, dynamic>) {
        final name = artistField['name']?.toString() ?? '';
        return name.isNotEmpty ? [name] : [];
      }
    }
    return [];
  }
}