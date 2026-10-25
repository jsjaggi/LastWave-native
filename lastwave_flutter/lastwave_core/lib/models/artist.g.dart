// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Artist _$ArtistFromJson(Map<String, dynamic> json) => _Artist(
  id: json['id'] as String,
  name: json['name'] as String,
  bio: json['bio'] as String?,
  coverArtUrl: json['coverArtUrl'] as String?,
  followers: (json['followers'] as num).toInt(),
  monthlyListeners: (json['monthlyListeners'] as num).toInt(),
  similarArtists: (json['similarArtists'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ArtistToJson(_Artist instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'bio': instance.bio,
  'coverArtUrl': instance.coverArtUrl,
  'followers': instance.followers,
  'monthlyListeners': instance.monthlyListeners,
  'similarArtists': instance.similarArtists,
};
