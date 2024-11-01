import 'package:flutter/material.dart';
import 'package:rest_api_with_provider/features/users/data/models/user_model.dart';
import 'package:rest_api_with_provider/get_it.dart';
import 'package:rest_api_with_provider/photo.dart';
import 'package:rest_api_with_provider/user_api.dart';
import 'package:rest_api_with_provider/user.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  final UserApi userRepo = locate<UserApi>();
  List<UserModel> _users = [];
  List<UserModel> get users => _users;
  List<Photo> _photos = [];
  List<Photo> get photos => _photos;

  ValueNotifier<List<UserModel>> usersNotifier = ValueNotifier<List<UserModel>>([]);
  ValueNotifier<List<Photo>> photosNotifier = ValueNotifier<List<Photo>>([]);


  UserProvider() {
    _fetchUsers();
    _fetchPhotos();
  }

  Future<void> _fetchUsers() async {
    final result = await userRepo.fetchUser();

    result.fold(
      (error) {
        print('Error fetching users: ${error.message}');
      },
      (users) {
        _users = users;
        notifyListeners(); // Notify listeners that the data has changed
      },
    );
  }

  Future<void> _fetchPhotos() async {
  final result = await userRepo.fetchPhotos();

  result.fold(
    (error) {
      _photos = []; // Vider la liste en cas d'erreur
      notifyListeners();
    },
    (photos) {
      _photos = photos;
      notifyListeners(); // Notifier les listeners que la liste de photos a changé
    },
  );
}
}
