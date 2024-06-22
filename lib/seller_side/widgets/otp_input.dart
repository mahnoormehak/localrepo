import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPInputField extends StatelessWidget {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 0),
      child: Pinput(
        length: 6,
        controller: _otpController,
        defaultPinTheme: PinTheme(
          width: 70,
          height: 78,
          textStyle: TextStyle(fontSize: 30, color: Colors.black),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        focusedPinTheme: PinTheme(
          width: 70,
          height: 78,
          textStyle: TextStyle(fontSize: 30, color: Colors.black),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        submittedPinTheme: PinTheme(
          width: 70,
          height: 78,
          textStyle: TextStyle(fontSize: 30, color: Colors.black),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.length < 6) {
            return 'Please enter a valid 6-digit code';
          }
          return null;
        },
      ),
    );
  }
}
