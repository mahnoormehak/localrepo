
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final IconData icon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.text,
        prefixIcon: Icon(widget.icon), // Using the icon here
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

