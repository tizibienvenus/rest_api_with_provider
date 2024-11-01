import 'package:dartz/dartz.dart';
import 'package:rest_api_with_provider/core/error/faillure.dart';
import 'package:rest_api_with_provider/features/users/domain/entities/user_entity.dart';


abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
}
