import 'package:flutter/material.dart';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:localrepo/chat/database-helper/helper.dart';
import 'package:localrepo/chat/model/chatUser.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';

class ChatScreen extends StatefulWidget {
  final String sellerName;

  const ChatScreen({super.key, required this.sellerName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final TextEditingController messageController = TextEditingController();
  List<Message> chatList = [];
  bool isEmojiVisible = false;

  @override
  void initState() {
    super.initState();
    _updateChatList();
  }

  void _updateChatList() async {
    final List<Message> updatedChatList = await databaseHelper.getMessageList();
    setState(() {
      chatList = updatedChatList;
    });
  }

  void _sendMessage(String message, String type) async {
    final newMessage = Message(
      id: null,
      toId: widget.sellerName,
      fromId: "User",
      msg: message,
      sent: DateTime.now().millisecondsSinceEpoch.toString(),
      read: '0',
      type: type,
    );
    await databaseHelper.insertMessage(newMessage);
    messageController.clear();
    _updateChatList();
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _sendMessage(pickedFile.path, 'image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: 'Messages',
        appBarHeight: 100.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                final chat = chatList[index];
                final isUserMessage = chat.fromId == "User";
                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color:
                          isUserMessage ? Colors.grey[300] : Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: chat.type == 'image'
                        ? Image.file(File(chat.msg))
                        : Text(
                            chat.msg,
                            style: TextStyle(
                              color:
                                  isUserMessage ? Colors.black : Colors.white,
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          if (isEmojiVisible)
            SizedBox(
              height: 250,
              child: EmojiPicker(
                onEmojiSelected: (category, emoji) {
                  messageController.text += emoji.emoji;
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.emoji_emotions_outlined),
                  onPressed: () {
                    setState(() {
                      isEmojiVisible = !isEmojiVisible;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: _pickImage,
                ),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isEmojiVisible = false;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      _sendMessage(messageController.text, 'text');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:localrepo/chat/database-helper/helper.dart';
// import 'package:localrepo/chat/model/chatUser.dart';

// class ChatScreen extends StatefulWidget {
//   final String sellerName;

//   const ChatScreen({super.key, required this.sellerName});

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final DatabaseHelper databaseHelper = DatabaseHelper();
//   final TextEditingController messageController = TextEditingController();
//   List<Message> chatList = [];
//   bool isEmojiVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     _updateChatList();
//   }

//   void _updateChatList() async {
//     final List<Message> updatedChatList = await databaseHelper.getMessageList();
//     setState(() {
//       chatList = updatedChatList;
//     });
//   }

//   void _sendMessage(String message, String type) async {
//     final newMessage = Message(
//       id: null,
//       toId: widget.sellerName,
//       fromId: "User",
//       msg: message,
//       sent: DateTime.now().millisecondsSinceEpoch.toString(),
//       read: '0',
//       type: type,
//     );
//     await databaseHelper.insertMessage(newMessage);
//     messageController.clear();
//     _updateChatList();
//   }

//   void _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       _sendMessage(pickedFile.path, 'image');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chat with ${widget.sellerName}"),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: chatList.length,
//               itemBuilder: (context, index) {
//                 final chat = chatList[index];
//                 final isUserMessage = chat.fromId == "User";
//                 return Align(
//                   alignment: isUserMessage ? Alignment.centerLeft : Alignment.centerRight,
//                   child: Container(
//                     padding: const EdgeInsets.all(10.0),
//                     margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//                     decoration: BoxDecoration(
//                       color: isUserMessage ? Colors.grey[300] : Colors.blueAccent,
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: chat.type == 'image'
//                         ? Image.file(File(chat.msg))
//                         : Text(
//                             chat.msg,
//                             style: TextStyle(
//                               color: isUserMessage ? Colors.black : Colors.white,
//                             ),
//                           ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           if (isEmojiVisible)
//             SizedBox(
//               height: 250,
//               child: EmojiPicker(
//                 onEmojiSelected: (category, emoji) {
//                   messageController.text += emoji.emoji;
//                 },
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.emoji_emotions_outlined),
//                   onPressed: () {
//                     setState(() {
//                       isEmojiVisible = !isEmojiVisible;
//                     });
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.image),
//                   onPressed: _pickImage,
//                 ),
//                 Expanded(
//                   child: TextField(
//                     controller: messageController,
//                     decoration: InputDecoration(
//                       hintText: "Type a message",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     onTap: () {
//                       setState(() {
//                         isEmojiVisible = false;
//                       });
//                     },
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     if (messageController.text.isNotEmpty) {
//                       _sendMessage(messageController.text, 'text');
//                     }
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


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:localrepo/chat/controller/chat_controller.dart';
// // import 'package:localrepo/chat/model/chatUser.dart';
// import 'package:localrepo/getx_logic/chat_cont.dart';

// class ChatScreen extends StatelessWidget {
//   final String sellerName;
//   final ChatController chatController = Get.put(ChatController());

//   ChatScreen({super.key, required this.sellerName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chat with $sellerName"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               return ListView.builder(
//                 itemCount: chatController.messages.length,
//                 itemBuilder: (context, index) {
//                   final message = chatController.messages[index];
//                   return ListTile(
//                     title: Text(message.msg),
//                     subtitle: Text(message.fromId),
//                     trailing: Text(message.sent),
//                   );
//                 },
//               );
//             }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: chatController.textController,
//                     decoration: InputDecoration(
//                       hintText: "Type a message",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () {
//                     if (chatController.textController.text.isNotEmpty) {
//                       chatController.sendMessage(
//                         sellerName,
//                         'User', // Replace with actual user ID
//                         chatController.textController.text,
//                         'text',
//                       );
//                       chatController.textController.clear();
//                     }
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


// import 'package:flutter/material.dart';
// import 'package:localrepo/chat/database-helper/helper.dart';

// class ChatScreen extends StatefulWidget {
//   final String sellerName;

//   const ChatScreen({super.key, required this.sellerName});

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final DatabaseHelper databaseHelper = DatabaseHelper();
//   final TextEditingController messageController = TextEditingController();
//   List<Chat> chatList = [];

//   @override
//   void initState() {
//     super.initState();
//     _updateChatList();
//   }

//   void _updateChatList() async {
//     final List<Chat> updatedChatList = await databaseHelper.getChatList();
//     setState(() {
//       chatList = updatedChatList;
//     });
//   }

//   void _sendMessage(String message) async {
//     final newChat = Chat(
//       sender: "User",
//       receiver: widget.sellerName,
//       message: message,
//       dateTime: DateTime.now().toIso8601String(),
//     );
//     await databaseHelper.insertChat(newChat);
//     messageController.clear();
//     _updateChatList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chat with ${widget.sellerName}"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: chatList.length,
//               itemBuilder: (context, index) {
//                 final chat = chatList[index];
//                 return ListTile(
//                   title: Text(chat.message),
//                   subtitle: Text(chat.sender),
//                   trailing: Text(chat.dateTime),
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
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     if (messageController.text.isNotEmpty) {
//                       _sendMessage(messageController.text);
//                     }
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


// // ignore_for_file: unused_field

// import 'package:flutter/material.dart';
// import 'package:localrepo/chat/model/chatUser.dart';

// class ChatScreen extends StatefulWidget {
//   final ChatUser? user; // Change to nullable ChatUser

//   const ChatScreen({Key? key, this.user}) : super(key: key);

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   List<Message> _list = [];
//   final _textController = TextEditingController();
//   bool _showEmoji = false, _isUploading = false;

//   @override
//   Widget build(BuildContext context) {
//     // Check if user is null and provide a placeholder name
//     String userName = widget.user?.name ?? 'Unknown User';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(userName),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _list.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_list[index].msg),
//                   subtitle: Text(_list[index].sent),
//                 );
//               },
//             ),
//           ),
//           _chatInput(),
//         ],
//       ),
//     );
//   }

//   Widget _chatInput() {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _textController,
//               decoration: InputDecoration(
//                 hintText: 'Type a message',
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               if (_textController.text.isNotEmpty) {
//                 // Handle sending message logic here
//                 _textController.clear();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:localrepo/chat/model/chatUser.dart';
// import 'package:localrepo/getx_logic/chat_cont.dart';

// class ChatScreen extends StatelessWidget {
//   final ChatUser? user;
//   final ChatController controller = Get.put(ChatController());

//   ChatScreen({required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//             user?.name ?? 'Chat'), // Use a placeholder name if user is null
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               return ListView.builder(
//                 itemCount: controller.messages.length,
//                 itemBuilder: (context, index) {
//                   var message = controller.messages[index];
//                   return ListTile(
//                     title: Text(message.msg),
//                     subtitle: Text(message.sent),
//                   );
//                 },
//               );
//             }),
//           ),
//           _chatInput(),
//         ],
//       ),
//     );
//   }

//   Widget _chatInput() {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: controller.textController,
//               decoration: InputDecoration(
//                 hintText: 'Type a message',
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               if (controller.textController.text.isNotEmpty) {
//                 controller.sendMessage(
//                   user?.id ?? 'default_id', // Use a default ID if user is null
//                   'your_id', // Replace with the actual sender's ID
//                   controller.textController.text,
//                   'text',
//                 );
//                 controller.textController.clear();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
