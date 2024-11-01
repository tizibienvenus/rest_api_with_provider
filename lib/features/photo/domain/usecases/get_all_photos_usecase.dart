
import 'package:dartz/dartz.dart';
import 'package:rest_api_with_provider/core/error/faillure.dart';
import 'package:rest_api_with_provider/core/usecases/usecase.dart';
import 'package:rest_api_with_provider/features/photo/domain/entities/photo_entity.dart';
import 'package:rest_api_with_provider/features/photo/domain/repository/photo_repository.dart';

class GetPhotosUseCase implements UseCase<List<PhotoEntity>, NoParams>{
  final PhotoRepository repository;

  GetPhotosUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PhotoEntity>>> call(NoParams params) async {
    return await repository.getAllPhotos();
  }
}
