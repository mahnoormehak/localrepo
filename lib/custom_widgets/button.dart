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
  return ElevatedButton(onPressed:()=> onPressed(), 
  child: Text(text,
  style: TextStyle(fontSize: 20,
  fontWeight: FontWeight.bold),),
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(39),
      
    ),
    backgroundColor: Color.fromARGB(255, 127, 79, 190),
    padding: EdgeInsets.fromLTRB(40, 10, 40, 10)
  ),
  );
  }
}
//  Color.fromARGB(255, 154, 70, 175),