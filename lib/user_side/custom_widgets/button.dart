// import 'dart:html';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
final String text;
final Function onPressed;
const CustomButton({super.key, 
   required this.text,
  required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
  return ElevatedButton(
    onPressed:()=> onPressed(),
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
      
    ),
    backgroundColor: Color.fromARGB(255, 129, 61, 106),
    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
  ), 
  child: Text(text,
  
  style: const TextStyle(fontSize: 19,
  color: Colors.white,
  fontWeight: FontWeight.bold),), 

  );

  }
}
//  Color.fromARGB(255, 154, 70, 175),