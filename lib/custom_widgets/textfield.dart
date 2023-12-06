// custom_textfield.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String Text;

  CustomTextField({required this.controller, required this.Text});

  @override
  Widget build(BuildContext context) {
 return TextFormField(
controller: controller,
decoration: InputDecoration(
  labelText: Text,
  border: OutlineInputBorder(
    
    borderRadius: BorderRadius.circular(40),
  )
),
 );
  }
}