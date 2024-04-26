// import 'package:flutter/material.dart';
// import 'package:localrepo/contract_page/contract_page.dart';
// import 'package:localrepo/favorite/favorite_screen.dart';
// import 'package:localrepo/profile/profile_screen.dart';

// class Sidebar extends StatelessWidget {
//   static const String sidebar = '/sidebar';
//   const Sidebar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Text(
//               'Menu',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.category),
//             title: Text('Categories'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const FavoriteScreen()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: Text('Profile'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProfileScreen()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.assignment),
//             title: Text('Contract Page'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ContractPage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.logout),
//             title: Text('Signout'),
//             onTap: () {
//               Navigator.pop(context);
//               // Handle signout logic here
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:localrepo/contract_page/contract_page.dart';
import 'package:localrepo/favorite/favorite_screen.dart';
import 'package:localrepo/profile/profile_screen.dart';

class Sidebar extends StatelessWidget {
  static const String sidebar = '/sidebar';
  const Sidebar({super.key});

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
            title: const Text('Categories'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Contract Page'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContractPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Signout'),
            onTap: () {
              Navigator.pop(context);
              // Handle signout logic here
            },
          ),
        ],
      ),
    );
  }
}
