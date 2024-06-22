import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AgreementText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap on hyperlinks
      },
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "I agree to Equishare's ",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            TextSpan(
              text: 'Terms of Usage',
              style: TextStyle(fontSize: 14, color: Colors.blue, decoration: TextDecoration.underline),
              // Add onTap function here to handle tap on this hyperlink
              recognizer: TapGestureRecognizer()..onTap = () {
                // Handle tap on 'Terms of Usage' hyperlink
              },
            ),
            TextSpan(
              text: " and for my personal data to be processed according to ",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            TextSpan(
              text: 'Equishare Privacy Policy',
              style: TextStyle(fontSize: 14, color: Colors.blue, decoration: TextDecoration.underline),
              // Add onTap function here to handle tap on this hyperlink
              recognizer: TapGestureRecognizer()..onTap = () {
                // Handle tap on 'Equishare Privacy Policy' hyperlink
              },
            ),
          ],
        ),
      ),
    );
  }
}
