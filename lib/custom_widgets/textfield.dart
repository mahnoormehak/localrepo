import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final IconData icon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.icon, required String? Function(dynamic value) validator,
  });

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
        prefixIcon: Icon(widget.icon),
        // Using the icon here
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Colors.orange,width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Colors.purple,width: 3),
          
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
