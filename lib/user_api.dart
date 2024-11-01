import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Use 'http' instead of 'Response'
import 'package:rest_api_with_provider/features/users/data/models/user_model.dart';
import 'package:rest_api_with_provider/photo.dart';
import 'package:rest_api_with_provider/result.dart'; // Ensure this file contains ErrorHandler
import 'package:rest_api_with_provider/user.dart'; // Ensure this file contains User and fromMap

class UserApi {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  ValueNotifier<List<UserModel>> usersNotifier = ValueNotifier<List<UserModel>>([]);
  ValueNotifier<List<Photo>> photosNotifier = ValueNotifier<List<Photo>>([]);

  Future<Either<ErrorHandler, List<UserModel>>> fetchUser() async {
    try {
      const String apiUrl = '$_baseUrl/Users';
      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<UserModel> users = await compute(parseUsers, response.body);
        return Right(users);
      } else {
        return Left(ErrorHandler(message: 'Failed to load Users'));
      }
    } catch (error) {
      return Left(ErrorHandler(message: error.toString()));
    }
  }

  Future<Either<ErrorHandler, List<Photo>>> fetchPhotos() async {
    try {
      const String apiUrl = '$_baseUrl/photos';
      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<Photo> photos = await compute(parsePhotos, response.body);

        return Right(photos); // Return the list of photos
      } else {
        return Left(ErrorHandler(message: 'Failed to load photos'));
      }
    } catch (error) {
      return Left(ErrorHandler(message: error.toString()));
    }
  }

  static List<Photo> parsePhotos(String responseBody) {
    final parsed = (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  static List<UserModel> parseUsers(String responseBody) {
    final parsed = (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromMap(json)).toList();
  }

}

/*
  Future<Either<ErrorHandler, List<User>>> fetchUser() async {
    try {
      const String apiUrl = '$_baseUrl/users';
      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        final List<User> users = body
            .map((dynamic item) => User.fromMap(item as Map<String, dynamic>))
            .toList();
        return Right(users); // Success
      } else {
        return Left(ErrorHandler(message: 'Failed to load users with status ${response.statusCode}'));
      }
    } catch (error) {
      return Left(ErrorHandler(message: error.toString())); // Error
    }
  }


  Future<Either<ErrorHandler, List<User>>> fetchUser() async {
    try {
      const String apiUrl = '$_baseUrl/users';
      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        final List<User> users = body
            .map((dynamic item) => User.fromMap(item as Map<String, dynamic>))
            .toList();

        return Right(users); // Return the list of users
      } else {
        return Left(ErrorHandler(message: 'Failed to load users'));
      }
    } catch (error) {
      return Left(ErrorHandler(message: error.toString()));
    }
  }
  
  

  Future<Either<ErrorHandler, List<Photo>>> fetchPhotos() async {
    try {
      const String apiUrl = '$_baseUrl/photos';
      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        final List<Photo> photos = body
            .map((dynamic item) => Photo.fromJson(item as Map<String, dynamic>))
            .toList();

        return Right(photos); // Return the list of photos
      } else {
        return Left(ErrorHandler(message: 'Failed to load photos'));
      }
    } catch (error) {
      return Left(ErrorHandler(message: error.toString()));
    }
  }
*/