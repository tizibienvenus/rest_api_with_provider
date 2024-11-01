import 'package:flutter/material.dart';
import 'package:rest_api_with_provider/features/users/data/data_sources/user_source_remote.dart';
import 'package:rest_api_with_provider/features/users/data/data_sources/user_sources_local.dart';
import 'package:rest_api_with_provider/features/users/data/models/user_model.dart';
import 'package:rest_api_with_provider/features/users/data/repository/user_repo.dart';
import 'package:rest_api_with_provider/features/users/domain/entities/user_entity.dart';
import 'package:rest_api_with_provider/features/users/domain/repository/user_repository.dart';
import 'package:rest_api_with_provider/get_it.dart';
import 'package:rest_api_with_provider/photo.dart';
import 'package:rest_api_with_provider/user_api.dart';
import 'package:rest_api_with_provider/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userProvider = ChangeNotifierProvider<UserProvider>((ref) {
  return UserProvider();
});



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


final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});


final userSourceRemoteProvider = Provider<UserSourceRemote>((ref) {
  return UserSourceRemoteImpl();
});


final userSourceLocalProvider = FutureProvider<UserSourceLocal>((ref) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  return UserSourceLocalImpl(sharedPreferences: sharedPreferences);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final remoteDataSource = ref.watch(userSourceRemoteProvider);
  final localDataSource = ref.watch(userSourceLocalProvider).value;
  return UserRepositoryImpl(remoteDataSource: remoteDataSource, localeDataSource: localDataSource!);
});

final userListProvider = FutureProvider<List<UserEntity>>((ref) async {
  final userRepository = ref.watch(userRepositoryProvider);
  final result = await userRepository.getAllUsers();
  
  return result.fold(
    (failure) {
      throw Exception('Failed to load users: $failure');
    },
    (users) => users,
  );
});