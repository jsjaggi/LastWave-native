import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:lastwave_core/models/track.dart';
import 'package:lastwave_core/models/artist.dart';
import 'package:lastwave_core/models/album.dart';
import 'package:lastwave_core/models/lyrics.dart';

abstract class LastFmApiService {
  Future<List<Track>> searchTracks(String query, {int limit = 50});
  Future<List<Artist>> searchArtists(String query, {int limit = 50});
  Future<List<Album>> searchAlbums(String query, {int limit = 50});
  Future<List<Lyrics>> getLyrics(String trackId, String artistName);
}

class LastFmApiServiceImpl implements LastFmApiService {
  final Dio _dio;

  LastFmApiServiceImpl(this._dio);

  @override
  Future<List<Track>> searchTracks(String query, {int limit = 50}) async {
    final response = await _dio.get(
      'https://ws.audioscrobbler.com/2.0/',
      queryParameters: {
        'method': 'track.search',
        'track': query,
        'limit': limit,
        'format': 'json',
      },
    );

    if (response.statusCode != 200) {
      throw FormatException('Last.fm API error: ${response.statusCode}');
    }

    final json = response.data;
    final tracks = (json['results']['trackmatches']['track'] as List?)
        ?.map((t) => Track.fromJson(t as Map<String, dynamic>))
        .toList() ?? [];

    return tracks;
  }

  @override
  Future<List<Artist>> searchArtists(String query, {int limit = 50}) async {
    final response = await _dio.get(
      'https://ws.audioscrobbler.com/2.0/',
      queryParameters: {
        'method': 'artist.search',
        'artist': query,
        'limit': limit,
        'format': 'json',
      },
    );

    if (response.statusCode != 200) {
      throw FormatException('Last.fm API error: ${response.statusCode}');
    }

    final json = response.data;
    final artists = (json['results']['artistmatches']['artist'] as List?)
        ?.map((a) => Artist.fromJson(a as Map<String, dynamic>))
        .toList() ?? [];

    return artists;
  }

  @override
  Future<List<Album>> searchAlbums(String query, {int limit = 50}) async {
    final response = await _dio.get(
      'https://ws.audioscrobbler.com/2.0/',
      queryParameters: {
        'method': 'album.search',
        'album': query,
        'limit': limit,
        'format': 'json',
      },
    );

    if (response.statusCode != 200) {
      throw FormatException('Last.fm API error: ${response.statusCode}');
    }

    final json = response.data;
    final albums = (json['results']['albummatches']['album'] as List?)
        ?.map((al) => Album.fromJson(al as Map<String, dynamic>))
        .toList() ?? [];

    return albums;
  }

  @override
  Future<List<Lyrics>> getLyrics(String trackId, String artistName) async {
    final response = await _dio.get(
      'https://ws.audioscrobbler.com/2.0/',
      queryParameters: {
        'method': 'track.getLyrics',
        'track': trackId,
        'artist': artistName,
        'format': 'json',
      },
    );

    if (response.statusCode != 200) {
      throw FormatException('Last.fm API error: ${response.statusCode}');
    }

    final json = response.data;
    final lyricsList = (json['lyrics'] as List?)
        ?.map((l) => Lyrics.fromJson(l as Map<String, dynamic>))
        .toList() ?? [];

    return lyricsList;
  }
}