import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/screens/login/resetpassword.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/button.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // Adjust padding as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Align items to the start (left)
              children: [
              
              Image.asset(
                'assets/images/account_security.png',
                height: 250,
                width: 250,
              ),
                SizedBox(height: 20), // Add space between elements
                Padding(
                  padding: const EdgeInsets.fromLTRB(100,0,100,12),
                  child: Text(
                    "To protect your account security, we need to verify your identity.",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                 SizedBox(height: 40),
                   Padding(
                  padding: const EdgeInsets.fromLTRB(100,0,100,12),
                  child: Text(
                    "Please choose a way to verify",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: 'Verify through WhatsApp',
                  color: AppColors.btn2color,
                   fontcolor: Colors.black54,
                  onPressed: () {
                  //                  Navigator.push(
                  // context,
                  // MaterialPageRoute(builder: (context) => ResetPassword()),
                  // );
                    print('Button Pressed');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}