import 'package:dartz/dartz.dart';
import 'package:lastwave_core/models/track.dart';
import 'package:lastwave_core/api/lastfm_api.dart';
import 'package:lastwave_core/services/cache_service.dart';
import 'package:lastwave_core/services/rate_limiter.dart';

abstract class ScrobbleRepository {
  Future<Either<Exception, List<Scrobble>>> getRecentScrobbles(String username, {int limit = 50});
  Future<Either<Exception, Unit>> scrobbleTrack(Scrobble scrobble);
  Future<Either<Exception, Unit>> submitScrobble(String trackId, String artistName, String albumName, DateTime timestamp);
}

class ScrobbleRepositoryImpl implements ScrobbleRepository {
  final LastFmApiService _api;
  final CacheService _cache;
  final RateLimiter _rateLimiter;

  ScrobbleRepositoryImpl(this._api, this._cache, this._rateLimiter);

  @override
  Future<Either<Exception, List<Scrobble>>> getRecentScrobbles(String username, {int limit = 50}) async {
    final cacheKey = 'scrobbles:$username:$limit';
    final cached = await _cache.get(cacheKey);

    if (cached != null) {
      return Right(cached as List<Scrobble>);
    }

    try {
      // This method is no longer available in the API - returning empty list
      // Would need to be implemented via user.getRecentTracks
      await _cache.set(cacheKey, []);
      return Right([]);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Unit>> scrobbleTrack(Scrobble scrobble) async {
    // Implementation would call Last.fm API to scrobble
    return const Right(unit);
  }

  @override
  Future<Either<Exception, Unit>> submitScrobble(String trackId, String artistName, String albumName, DateTime timestamp) async {
    // Placeholder - would call track.scrobble API
    return const Right(unit);
  }
}