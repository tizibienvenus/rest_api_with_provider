
import 'package:dartz/dartz.dart';
import 'package:rest_api_with_provider/core/error/faillure.dart';
import 'package:rest_api_with_provider/core/usecases/usecase.dart';
import 'package:rest_api_with_provider/features/users/domain/entities/user_entity.dart';
import 'package:rest_api_with_provider/features/users/domain/repository/user_repository.dart';

class GetUsersUseCase implements UseCase<List<UserEntity>, NoParams>{
  final UserRepository repository;

  GetUsersUseCase({required this.repository});

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) async {
    return await repository.getAllUsers();
  }
}
