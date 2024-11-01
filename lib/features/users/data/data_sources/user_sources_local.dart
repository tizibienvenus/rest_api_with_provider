import 'dart:convert';
import 'package:rest_api_with_provider/features/users/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class UserSourceLocal {
  Future<void> cacheUsers(List<UserModel> users);
  Future<void> cacheUser(UserModel user);
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUser(int userId);

}


class UserSourceLocalImpl implements UserSourceLocal {
  final userKey = "cached_user";
  late final SharedPreferences sharedPreferences;

  UserSourceLocalImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUser(UserModel user) async {
    final List<UserModel> users = await getUsers();
    final userIndex = users.indexWhere((element) => element.id == user.id);

    if (userIndex == -1) {
      users.add(user);
    } else {
      users[userIndex] = user;
    }
    await cacheUsers(users);
  }

  @override
  Future<void> cacheUsers(List<UserModel> users) async {
    final jsonEncoded = jsonEncode(users.map((user) => user.toJson()).toList());
    await sharedPreferences.setString(userKey, jsonEncoded);
  }

  @override
  Future<UserModel> getUser(int userId) async {
    final users = await getUsers();
    return users.firstWhere((user) => user.id == userId);
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final jsonEncoded = sharedPreferences.getString(userKey);
    if (jsonEncoded != null) {
      try {
        final List<dynamic> jsonDecoded = jsonDecode(jsonEncoded);
        return jsonDecoded.map<UserModel>((json) => UserModel.fromJson(json)).toList();
      } catch (e) {
        // Gérer l'erreur ici
        return <UserModel>[];
      }
    }
    return <UserModel>[];
  }
}



