import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final String? Function(String?)? validator;
  final Function(dynamic value) onChanged;
  final int maxLines; // Added maxLines property

  CustomTextField({
    required this.controller,
    required this.labelText,
    required this.icon,
    this.validator,
    required this.onChanged,
    this.maxLines = 1, // Default value for maxLines
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines, // Set maxLines from widget property
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(widget.icon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Colors.black38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        filled: true,
        fillColor: Color.fromARGB(254, 242, 241, 241),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
