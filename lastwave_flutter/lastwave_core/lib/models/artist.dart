import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist.freezed.dart';
part 'artist.g.dart';

@freezed
class Artist with _$Artist {
  const factory Artist({
    required String id,
    required String name,
    required String? bio,
    required String? coverArtUrl,
    required int followers,
    required int monthlyListeners,
    required List<String>? similarArtists,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}