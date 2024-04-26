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
  return ElevatedButton(onPressed:()=> onPressed(),
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(39),
      
    ),
    backgroundColor: const Color.fromARGB(255, 228, 138, 228),
    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10)
  ), 
  child: Text(text,
  style: const TextStyle(fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold),),
  );
  }
}
//  Color.fromARGB(255, 154, 70, 175),