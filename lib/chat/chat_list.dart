// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:localrepo/getx_logic/chat_cont.dart';

// import 'chat_screen.dart';

// class ChatListScreen extends StatelessWidget {
//   final ChatController chatController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chats"),
//       ),
//       body: Obx(
//         () {
//           var sellers = chatController.messages.keys.toList();
//           return ListView.builder(
//             itemCount: sellers.length,
//             itemBuilder: (context, index) {
//               String seller = sellers[index];
//               List<ChatMessage> messages = chatController.getMessages(seller);
//               ChatMessage lastMessage = messages.last;
//               return ListTile(
//                 title: Text(seller),
//                 subtitle: Text(
//                   lastMessage.isImage ? "Image" : lastMessage.message,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 trailing: Text(
//                   DateFormat('hh:mm a').format(lastMessage.timestamp),
//                 ),
//                 onTap: () {
//                   Get.to(() => ChatScreen(seller: seller));
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class ChatMessage {
//   final String sender;
//   final String message;
//   final DateTime timestamp;
//   final bool isImage;

//   ChatMessage({
//     required this.sender,
//     required this.message,
//     required this.timestamp,
//     this.isImage = false,
//   });
// }
