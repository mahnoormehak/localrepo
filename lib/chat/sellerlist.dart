import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/chat/chat_screen.dart';

import 'package:localrepo/chat/model/chatUser.dart';

class SellersListScreen extends StatelessWidget {
  final List<ChatUser> sellers;
  final String sellerName;

  const SellersListScreen({
    Key? key,
    required this.sellers,
    required this.sellerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sellers'),
      ),
      body: ListView.builder(
        itemCount: sellers.length,
        itemBuilder: (context, index) {
          final seller = sellers[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(seller.image),
            ),
            title: Text(seller.name),
            subtitle: Text(seller.lastActive),
            trailing: Icon(
              seller.isOnline ? Icons.circle : Icons.circle_outlined,
              color: seller.isOnline ? Colors.green : Colors.red,
            ),
            onTap: () {
              Get.to(
                () => ChatScreen(sellerName: sellerName),
              );
            },
          );
        },
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:localrepo/chat/chat_screen.dart';
// import 'package:localrepo/chat/model/chatUser.dart';

// class SellersListScreen extends StatelessWidget {
//   final List<ChatUser> sellers;

//   const SellersListScreen({super.key, required this.sellers});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sellers List"),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: ListView.builder(
//         itemCount: sellers.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.all(8.0),
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: NetworkImage(sellers[index].image),
//               ),
//               title: Text(sellers[index].name),
//               subtitle: Text(sellers[index].lastActive),
//               trailing: Icon(
//                 sellers[index].isOnline ? Icons.circle : Icons.circle_outlined,
//                 color: sellers[index].isOnline ? Colors.green : Colors.grey,
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ChatScreen(
//                       sellerName: sellers[index].name,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:localrepo/chat/model/chatUser.dart';

// class SellersListScreen extends StatelessWidget {
//   final List<ChatUser> sellers;

//   const SellersListScreen(
//       {super.key, required this.sellers, required String sellerName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sellers List"),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: ListView.builder(
//         itemCount: sellers.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.all(8.0),
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: NetworkImage(sellers[index].image),
//               ),
//               title: Text(sellers[index].name),
//               subtitle: Text(sellers[index].lastActive),
//               trailing: Icon(
//                 sellers[index].isOnline ? Icons.circle : Icons.circle_outlined,
//                 color: sellers[index].isOnline ? Colors.green : Colors.grey,
//               ),
//               onTap: () {},
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:localrepo/chat/chat_screen.dart';
// import 'package:localrepo/chat/model/chatUser.dart';

// class SellersListScreen extends StatelessWidget {
//   final List<ChatUser> sellers;

//   SellersListScreen({required this.sellers, required String sellerName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with Sellers'),
//       ),
//       body: ListView.builder(
//         itemCount: sellers.length,
//         itemBuilder: (context, index) {
//           final seller = sellers[index];
//           return Card(
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: NetworkImage(seller.image),
//               ),
//               title: Text(seller.name),
//               subtitle: Text(seller.isOnline ? 'Online' : 'Offline'),
//               onTap: () {
//                 Get.to(() => ChatScreen(sellerName: seller.name));
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
