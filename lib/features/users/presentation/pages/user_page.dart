import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_with_provider/features/photo/presentation/pages/photo_page.dart';
import 'package:rest_api_with_provider/features/users/domain/entities/user_entity.dart';
import 'package:rest_api_with_provider/features/users/presentation/bloc/user_provider.dart';

class UserListView extends ConsumerWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userlist = ref.watch(userListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESTAPI with provider'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoGridView(),)),
          icon: Icon(Icons.near_me)
        ),
      ),
      body: userlist.when(
        data: (users){
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return UserCard(user: users[index]);
            }
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

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${user.name} ${user.username}'),
      subtitle: Text(user.email),
    );
  }
}
