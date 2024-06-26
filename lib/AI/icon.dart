import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:localrepo/AI/chatgpt.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Add your onPressed functionality here
        //Get.to(()=>ChatScreen());
        print('Floating button pressed');
      },
      child: Icon(
        FontAwesomeIcons.robot, // Use the chat-related icon from FontAwesome
        size: 28.0, // Adjust the size as needed
      ),
      backgroundColor: Colors.blueAccent, // Customize the background color
      tooltip: 'Chat with GPT', // Add a tooltip
    );
  }
}
