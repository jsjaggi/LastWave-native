import 'package:dartz/dartz.dart';
import 'package:lastwave_core/models/album.dart';
import 'package:lastwave_core/api/lastfm_api.dart';

abstract class AlbumRepository {
  Future<Either<Exception, List<Album>>> search(String query);
  Future<Either<Exception, Album>> getAlbum(String id);
}

class AlbumRepositoryImpl implements AlbumRepository {
  final LastFmApiService _api;

  AlbumRepositoryImpl(this._api);

  @override
  Future<Either<Exception, List<Album>>> search(String query) async {
    try {
      final result = await _api.searchAlbums(query);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Album>> getAlbum(String id) async {
    try {
      final result = await _api.searchAlbums(id);
      return result.isNotEmpty ? Right(result.first) : Left(Exception('Album not found'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}