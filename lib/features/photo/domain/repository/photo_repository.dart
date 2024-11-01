import 'package:dartz/dartz.dart';
import 'package:rest_api_with_provider/core/error/faillure.dart';
import 'package:rest_api_with_provider/features/photo/domain/entities/photo_entity.dart';


abstract class PhotoRepository {
  Future<Either<Failure, List<PhotoEntity>>> getAllPhotos();
}
