import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:rest_api_with_provider/core/res/base.dart';
import 'package:rest_api_with_provider/core/res/endpoints.dart';
import 'package:rest_api_with_provider/features/photo/data/models/photo_model.dart';
import 'package:rest_api_with_provider/result.dart';


abstract class PhotoSourceRemote {
  Future<Either<ErrorHandler, List<PhotoModel>>> getPhotos();
}

class PhotoSourceRemoteImpl implements PhotoSourceRemote {
  ValueNotifier<List<PhotoModel>> photosNotifier = ValueNotifier<List<PhotoModel>>([]);

  @override
  Future<Either<ErrorHandler, List<PhotoModel>>> getPhotos() async {
    //Uri uri = Uri.http(Endpoints.getAllphotos);
    Uri uri = Uri.http(BasePath.baseUrl, "/photos");

    try {
      String? response = await NetworkUtility.fetch(uri);

      if (response != null) {
        //List<dynamic> jsonData = json.decode(response);
        //List<PhotoModel> photos = jsonData.map((json) => PhotoModel.fromMap(json)).toList();
        final List<PhotoModel> photos = await compute(parsephotos, response);
        photosNotifier.value = photos;
        return Right(photos); // Succès : Retourne la liste d'utilisateurs
      } else {
        return Left(ErrorHandler(message: "Aucune réponse reçue")); // Erreur : Pas de réponse
      }
    } catch (e) {
      print(e.toString());
      return Left(ErrorHandler(message: "Erreur lors de la récupération des utilisateurs : ${e.toString()}")); // Erreur : Exception
    }
  }

  static List<PhotoModel> parsephotos(String responseBody) {
    final parsed = (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    return parsed.map<PhotoModel>((json) => PhotoModel.fromMap(json)).toList();
  }
}