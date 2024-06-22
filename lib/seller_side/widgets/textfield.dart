import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/utils/colors.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final int maxLines;
  final Function(dynamic value) onChanged; // Added onChanged callback

  CustomTextField({
    required this.controller,
    required this.labelText,
    this.validator,
    this.maxLines = 1,
    required this.onChanged, // Required parameter for onChanged callback
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      onChanged: (value) => onChanged(value), // Call onChanged callback
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.blue), // Change to desired focus color
        ),
        filled: true,
        fillColor: Color.fromARGB(254, 242, 241, 241),
      ),
      validator: validator,
    );
  }
}






class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  PhoneTextField({required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.only(left: 15)),
            Image.asset(
              'assets/images/pakistani_flag.png',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 8),
            Text('+92', style: TextStyle(color: Colors.black)),
            SizedBox(width: 8),
          ],
        ),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: AppColors.btncolor),
        ),
        filled: true,
        fillColor: Color.fromARGB(254, 242, 241, 241),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a phone number';
        }
        if (!_isValidPakistaniNumber(value)) {
          return 'Please enter a valid Pakistani phone number';
        }
        return null;
      },
    );
  }

  bool _isValidPakistaniNumber(String number) {
    // Regular expression to validate Pakistani phone numbers
    final RegExp regExp = RegExp(r'^(?:\+92|0)?3[0-9]{2}[0-9]{7}$');
    return regExp.hasMatch(number);
  }
}
