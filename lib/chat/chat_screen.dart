import 'package:flutter/material.dart';

class chatScreen extends StatelessWidget {
  const chatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chat"),
      ),
      body: Center(
          child: Text(
        "data",
        style: TextStyle(fontSize: 24),
      )),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:localrepo/chat/chat_list.dart';
// import 'package:localrepo/getx_logic/chat_cont.dart';

// class ChatScreen extends StatelessWidget {
//   final String seller;
//   final ChatController chatController = Get.find();
//   final TextEditingController messageController = TextEditingController();

//   ChatScreen({required this.seller});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chat with $seller"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(
//               () {
//                 var messages = chatController.getMessages(seller);
//                 return ListView.builder(
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     var message = messages[index];
//                     bool isUser = message.sender == "User";
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Align(
//                         alignment: isUser
//                             ? Alignment.centerRight
//                             : Alignment.centerLeft,
//                         child: Container(
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             color:
//                                 isUser ? Colors.blueAccent : Colors.grey[200],
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: isUser
//                                 ? CrossAxisAlignment.end
//                                 : CrossAxisAlignment.start,
//                             children: [
//                               if (message.isImage)
//                                 Image.network(message.message)
//                               else
//                                 Text(
//                                   message.message,
//                                   style: TextStyle(
//                                     color: isUser ? Colors.white : Colors.black,
//                                   ),
//                                 ),
//                               SizedBox(height: 5),
//                               Text(
//                                 DateFormat('hh:mm a').format(message.timestamp),
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: isUser ? Colors.white : Colors.black54,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: messageController,
//                     decoration: InputDecoration(
//                       hintText: "Type a message",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     var message = ChatMessage(
//                       sender: "User",
//                       message: messageController.text,
//                       timestamp: DateTime.now(),
//                     );
//                     chatController.sendMessage(seller, message);
//                     messageController.clear();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
