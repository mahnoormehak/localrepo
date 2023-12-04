// import 'dart:html';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
final String text;
final Function onPressed;
CustomButton({
   required this.text,
  required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
  return ElevatedButton(onPressed: ()=> onPressed, 
  child: Text(text,
  style: TextStyle(fontSize: 20,
  fontWeight: FontWeight.bold),),
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      
    ),
    backgroundColor: Colors.blue.shade300,
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10)
  ),
  );
  }
}
