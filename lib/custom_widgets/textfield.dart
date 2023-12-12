// custom_textfield.dart
import 'package:flutter/material.dart';
// import 'package:localrepo/custom_widgets/icon.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String Text;

  CustomTextField({required this.controller, required this.Text});

  @override
  Widget build(BuildContext context) {
 return TextFormField(
  
controller: controller,
decoration: InputDecoration(
  prefixIcon: Icon(Icons.person,color: Colors.black,),
  
  labelText: Text,
  
  // suffix: requi,
  enabledBorder: OutlineInputBorder(
    
    borderRadius: BorderRadius.circular(40),
    borderSide: BorderSide(color: Colors.orange),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    borderSide: BorderSide(color: Colors.purple),
  ),
  filled: true,
  fillColor: Colors.white,
),
 );
  }
  
}
