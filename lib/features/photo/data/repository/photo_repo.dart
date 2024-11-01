import 'package:dartz/dartz.dart';
import 'package:rest_api_with_provider/core/error/faillure.dart';
import 'package:rest_api_with_provider/features/photo/data/data_sources/photo_source_remote.dart';
import 'package:rest_api_with_provider/features/photo/data/data_sources/photo_sources_local.dart';
import 'package:rest_api_with_provider/features/photo/domain/entities/photo_entity.dart';
import 'package:rest_api_with_provider/features/photo/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoSourceRemote remoteDataSource;
  final PhotoSourceLocal localeDataSource;

  PhotoRepositoryImpl({required this.remoteDataSource, required this.localeDataSource, });

  @override
  Future<Either<Failure, List<PhotoEntity>>> getAllPhotos() async{
    try{
      final remoteUser = await remoteDataSource.getPhotos();
      return remoteUser.fold(
        (error) => Left(ServerFailure()),
        (photos) => Right(photos.map((photo) => photo as PhotoEntity).toList())
      );
    }on ServerFailure{
      return Left(ServerFailure());
    }
  }
}