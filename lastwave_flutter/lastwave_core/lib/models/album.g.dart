// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Album _$AlbumFromJson(Map<String, dynamic> json) => _Album(
  id: json['id'] as String,
  name: json['name'] as String,
  artist: json['artist'] as String,
  coverArtUrl: json['coverArtUrl'] as String?,
  year: (json['year'] as num).toInt(),
  totalTracks: (json['totalTracks'] as num).toInt(),
  spotifyId: json['spotifyId'] as String?,
);

Map<String, dynamic> _$AlbumToJson(_Album instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'artist': instance.artist,
  'coverArtUrl': instance.coverArtUrl,
  'year': instance.year,
  'totalTracks': instance.totalTracks,
  'spotifyId': instance.spotifyId,
};
