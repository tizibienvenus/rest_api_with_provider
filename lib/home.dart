import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_with_provider/features/photo/presentation/pages/photo_page.dart';
import 'package:rest_api_with_provider/features/users/presentation/pages/user_page.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    UserListView(),
    PhotoGridView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.people),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.photo),
            label: '',
          ),
        ],
        onDestinationSelected: _onItemTapped,
        selectedIndex: selectedIndex,
      ),
    );
  }
}

/*
class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    //final state = context.read<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESTAPI with provider'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoListScreen(),))
,
          icon: Icon(Icons.near_me)
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final users = userProvider.users;

          if (users.isEmpty) {
            return Center(child: CircularProgressIndicator()); // Loading indicator while fetching
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return UserCard(user: users[index]);
            },
          );
        },
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${user.name} ${user.username}'),
      subtitle: Text(user.email),
    );
  }
}

class PhotoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, photosNotifier, child){
          final photos = photosNotifier.photos;

          if (photos.isEmpty) {
            return Center(child: CircularProgressIndicator()); // Loading indicator while fetching
          }
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
      ),
    );
  }
}
*/