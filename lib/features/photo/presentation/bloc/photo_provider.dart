import 'package:flutter/material.dart';
import 'package:rest_api_with_provider/features/photo/data/data_sources/photo_source_remote.dart';
import 'package:rest_api_with_provider/features/photo/data/data_sources/photo_sources_local.dart';
import 'package:rest_api_with_provider/features/photo/data/repository/photo_repo.dart';
import 'package:rest_api_with_provider/features/photo/domain/entities/photo_entity.dart';
import 'package:rest_api_with_provider/features/photo/domain/repository/photo_repository.dart';
import 'package:rest_api_with_provider/get_it.dart';
import 'package:rest_api_with_provider/photo.dart';
import 'package:rest_api_with_provider/user_api.dart';
import 'package:rest_api_with_provider/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
final userProvider = ChangeNotifierProvider<UserProvider>((ref) {
  return UserProvider();
});


class UserProvider extends ChangeNotifier {
  final UserApi userRepo = locate<UserApi>();
  List<User> _users = [];
  List<User> get users => _users;
  List<Photo> _photos = [];
  List<Photo> get photos => _photos;

  ValueNotifier<List<User>> usersNotifier = ValueNotifier<List<User>>([]);
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
        notifyListeners();
      },
    );
  }

  Future<void> _fetchPhotos() async {
  final result = await userRepo.fetchPhotos();

  result.fold(
    (error) {
      _photos = [];
      notifyListeners();
    },
    (photos) {
      _photos = photos;
      notifyListeners();
    },
  );
}
}
*/

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final photoSourceRemoteProvider = Provider<PhotoSourceRemote>((ref) {
  return PhotoSourceRemoteImpl();
});

final photoSourceLocalProvider = FutureProvider<PhotoSourceLocalImpl>((ref) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  return PhotoSourceLocalImpl(sharedPreferences: sharedPreferences);
});

final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  final remoteDataSource = ref.watch(photoSourceRemoteProvider);
  final localDataSource = ref.watch(photoSourceLocalProvider).value;
  return PhotoRepositoryImpl(remoteDataSource: remoteDataSource, localeDataSource: localDataSource!);
});

final photoListProvider = FutureProvider<List<PhotoEntity>>((ref) async {
  final photoRepository = ref.watch(photoRepositoryProvider);
  final result = await photoRepository.getAllPhotos();
  
  return result.fold(
    (failure) {
      throw Exception('Failed to load photos: $failure');
    },
    (photos) => photos,
  );
});