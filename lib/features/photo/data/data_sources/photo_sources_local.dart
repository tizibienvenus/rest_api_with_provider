import 'dart:convert';
import 'package:rest_api_with_provider/features/photo/data/models/photo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class PhotoSourceLocal {
  Future<void> cachePhotos(List<PhotoModel> photos);
  Future<void> cachePhoto(PhotoModel photo);
  Future<List<PhotoModel>> getPhotos();
  Future<PhotoModel> getPhoto(int photoId);

}

class PhotoSourceLocalImpl implements PhotoSourceLocal {
  final photoKey = "cached_photo";
  late final SharedPreferences sharedPreferences;

  PhotoSourceLocalImpl({required this.sharedPreferences});

  @override
  Future<void> cachePhoto(PhotoModel photo) async {
    final List<PhotoModel> photos = await getPhotos();
    final photoIndex = photos.indexWhere((element) => element.id == photo.id);

    if (photoIndex == -1) {
      photos.add(photo);
    } else {
      photos[photoIndex] = photo;
    }
    await cachePhotos(photos);
  }

  @override
  Future<void> cachePhotos(List<PhotoModel> photos) async {
    final jsonEncoded = jsonEncode(photos.map((photo) => photo.toJson()).toList());
    await sharedPreferences.setString(photoKey, jsonEncoded);
  }

  @override
  Future<PhotoModel> getPhoto(int photoId) async {
    final photos = await getPhotos();
    return photos.firstWhere((photo) => photo.id == photoId);
  }

  @override
  Future<List<PhotoModel>> getPhotos() async {
    final jsonEncoded = sharedPreferences.getString(photoKey);
    if (jsonEncoded != null) {
      try {
        final List<dynamic> jsonDecoded = jsonDecode(jsonEncoded);
        return jsonDecoded.map<PhotoModel>((json) => PhotoModel.fromJson(json)).toList();
      } catch (e) {
        return <PhotoModel>[];
      }
    }
    return <PhotoModel>[];
  }
}



