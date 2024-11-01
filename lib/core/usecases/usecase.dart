import 'package:dartz/dartz.dart';
import 'package:rest_api_with_provider/core/error/faillure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
