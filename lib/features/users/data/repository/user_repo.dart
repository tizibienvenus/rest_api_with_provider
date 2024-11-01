import 'package:dartz/dartz.dart';
import 'package:rest_api_with_provider/core/error/faillure.dart';
import 'package:rest_api_with_provider/features/users/data/data_sources/user_source_remote.dart';
import 'package:rest_api_with_provider/features/users/data/data_sources/user_sources_local.dart';
import 'package:rest_api_with_provider/features/users/domain/entities/user_entity.dart';
import 'package:rest_api_with_provider/features/users/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserSourceRemote remoteDataSource;
  final UserSourceLocal localeDataSource;

  UserRepositoryImpl({required this.remoteDataSource, required this.localeDataSource, });

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async{
    try{
      final remoteUser = await remoteDataSource.getUser();
      return remoteUser.fold(
        (error) => Left(ServerFailure()),
        (users) => Right(users.map((user) => user as UserEntity).toList())
      );
    }on ServerFailure{
      return Left(ServerFailure());
    }
  }
}