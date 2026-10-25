import 'package:dartz/dartz.dart';
import 'package:lastwave_core/models/lyrics.dart';
import 'package:lastwave_core/api/lastfm_api.dart';

abstract class LyricsRepository {
  Future<Either<Exception, Lyrics>> getLyrics(String trackId, String artistName);
  Future<Either<Exception, List<LyricLine>>> getLyricLines(String trackId, String artistName);
}

class LyricsRepositoryImpl implements LyricsRepository {
  final LastFmApiService _api;

  LyricsRepositoryImpl(this._api);

  @override
  Future<Either<Exception, Lyrics>> getLyrics(String trackId, String artistName) async {
    try {
      final result = await _api.getLyrics(trackId, artistName);
      return result.isNotEmpty ? Right(result.first) : Left(Exception('Lyrics not found'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<LyricLine>>> getLyricLines(String trackId, String artistName) async {
    try {
      final result = await _api.getLyrics(trackId, artistName);
      return result.isNotEmpty ? Right(result.first.lines) : Left(Exception('No lyric lines found'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}