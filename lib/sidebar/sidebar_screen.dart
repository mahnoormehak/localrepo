import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/profile/profile_screen.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Favorite'),
            onTap: () {
              Get.back();
              Get.toNamed('/favorite');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Get.back();
              Get.to(Profile());
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Contract Page'),
            onTap: () {
              Get.back();
              Get.toNamed('/contract');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Signout'),
            onTap: () {
              Get.back();
              Get.to(Profile());
              // Handle signout logic here
            },
          ),
        ],
      ),
    );
  }
}
