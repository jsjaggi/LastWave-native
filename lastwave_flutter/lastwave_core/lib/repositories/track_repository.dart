import 'package:dartz/dartz.dart';
import 'package:lastwave_core/models/track.dart';
import 'package:lastwave_core/api/lastfm_api.dart';
import 'package:lastwave_core/services/cache_service.dart';
import 'package:lastwave_core/services/rate_limiter.dart';

abstract class TrackRepository {
  Future<Either<Exception, List<Track>>> search(String query);
  Future<Either<Exception, Track>> getTrack(String id);
  Future<Either<Exception, List<Track>>> getSimilar(String id, {int limit = 10});
}

class TrackRepositoryImpl implements TrackRepository {
  final LastFmApiService _api;
  final CacheService _cache;
  final RateLimiter _rateLimiter;

  TrackRepositoryImpl(this._api, this._cache, this._rateLimiter);

  @override
  Future<Either<Exception, List<Track>>> search(String query) async {
    final cacheKey = 'track_search:$query';
    final cached = await _cache.get(cacheKey);

    if (cached != null) {
      return Right(cached as List<Track>);
    }

    try {
      final result = await _api.searchTracks(query);
      await _cache.set(cacheKey, result);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Track>> getTrack(String id) async {
    try {
      final result = await _api.searchTracks(id);
      return result.isNotEmpty ? Right(result.first) : Left(Exception('Track not found'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<Track>>> getSimilar(String id, {int limit = 10}) async {
    try {
      final result = await _api.searchTracks(id, limit: limit);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}