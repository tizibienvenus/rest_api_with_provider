import 'package:equatable/equatable.dart';

class PhotoEntity extends Equatable{
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const PhotoEntity({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  PhotoEntity copyWith({
    final int? albumId,
    final int? id,
    final String? title,
    final String? url,
    final String? thumbnailUrl,
  }){
    return PhotoEntity(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  @override
  List<Object?> get props {
    return[
      albumId,
      id,
      title,
      url,
      thumbnailUrl,
    ];
  }
}
