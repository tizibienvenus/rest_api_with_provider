
import 'package:get_it/get_it.dart';
import 'package:rest_api_with_provider/user_api.dart';

class GetItService {
  static final getIt = GetIt.instance;
  static initializeService() {
    getIt.registerSingleton<UserApi>(UserApi());

  }
}


T locate<T extends Object>() {
  return GetItService.getIt.get<T>();
}
