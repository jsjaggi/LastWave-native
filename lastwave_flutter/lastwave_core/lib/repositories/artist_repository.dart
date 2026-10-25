import 'package:dartz/dartz.dart';
import 'package:lastwave_core/models/artist.dart';
import 'package:lastwave_core/api/lastfm_api.dart';

abstract class ArtistRepository {
  Future<Either<Exception, List<Artist>>> search(String query);
  Future<Either<Exception, Artist>> getArtist(String id);
}

class ArtistRepositoryImpl implements ArtistRepository {
  final LastFmApiService _api;

  ArtistRepositoryImpl(this._api);

  @override
  Future<Either<Exception, List<Artist>>> search(String query) async {
    try {
      final result = await _api.searchArtists(query);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Artist>> getArtist(String id) async {
    try {
      final result = await _api.searchArtists(id);
      return result.isNotEmpty ? Right(result.first) : Left(Exception('Artist not found'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}