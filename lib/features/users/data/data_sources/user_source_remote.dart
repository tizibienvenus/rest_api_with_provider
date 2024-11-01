import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:rest_api_with_provider/core/res/base.dart';
import 'package:rest_api_with_provider/core/res/endpoints.dart';
import 'package:rest_api_with_provider/features/users/data/models/user_model.dart';
import 'package:rest_api_with_provider/result.dart';


abstract class UserSourceRemote {
  Future<Either<ErrorHandler, List<UserModel>>> getUser();
}

class UserSourceRemoteImpl implements UserSourceRemote {
  ValueNotifier<List<UserModel>> usersNotifier = ValueNotifier<List<UserModel>>([]);

  @override
  Future<Either<ErrorHandler, List<UserModel>>> getUser() async {
    //Uri uri = Uri.http(Endpoints.getAllUsers);
    Uri uri = Uri.http(BasePath.baseUrl, "/Users");

    try {
      String? response = await NetworkUtility.fetch(uri);

      if (response != null) {
        //List<dynamic> jsonData = json.decode(response);
        //List<UserModel> users = jsonData.map((json) => UserModel.fromMap(json)).toList();
        final List<UserModel> users = await compute(parseUsers, response);
        usersNotifier.value = users;
        return Right(users); // Succès : Retourne la liste d'utilisateurs
      } else {
        return Left(ErrorHandler(message: "Aucune réponse reçue")); // Erreur : Pas de réponse
      }
    } catch (e) {
      print(e.toString());
      return Left(ErrorHandler(message: "Erreur lors de la récupération des utilisateurs : ${e.toString()}")); // Erreur : Exception
    }
  }

  static List<UserModel> parseUsers(String responseBody) {
    final parsed = (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromMap(json)).toList();
  }
}