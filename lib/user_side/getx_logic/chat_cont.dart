import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/chat/database-helper/helper.dart';
import 'package:localrepo/chat/model/chatUser.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;
  TextEditingController textController = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    fetchMessages();
  }

  void fetchMessages() async {
    var messageMapList = await databaseHelper.getMessageMapList();
    messages.assignAll(messageMapList
        .map((messageMap) => Message.fromMap(messageMap))
        .toList());
  }

  void sendMessage(String toId, String fromId, String msg, String type) {
    var message = Message(
      id: null,
      toId: toId,
      fromId: fromId,
      msg: msg,
      sent: DateTime.now().millisecondsSinceEpoch.toString(),
      read: '0',
      type: type,
    );
    databaseHelper.insertMessage(message);
    fetchMessages();
  }
}
