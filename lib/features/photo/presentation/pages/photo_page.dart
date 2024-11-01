import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_with_provider/features/photo/presentation/bloc/photo_provider.dart';

class PhotoGridView extends ConsumerWidget {
  const PhotoGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photolist = ref.watch(photoListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESTAPI with provider'),
      ),
      body: photolist.when(
        data: (photos){
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return Image.network(photos[index].thumbnailUrl);
            },
          );
        }, 
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) {
          print(error.toString());
          return Center(
          child: Text(
            "Error $error"
          ),
        );
        }, 
      )
    ); 
  }
}