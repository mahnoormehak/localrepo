import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/screens/login/login.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/button.dart';
import 'package:localrepo/seller_side/widgets/headtext.dart';
import 'package:localrepo/user_side/login%20screens/login.dart';
class Index extends StatelessWidget {
  const Index({super.key});

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
                HeadText(
                  icon: Icons.camera_alt_outlined,
                  text: "Equishare",
                  fontSize: 46,
                ),
                SizedBox(height: 20), // Add space between elements
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,12),
                  child: Text(
                    "Welcome!!! Be a part of millions of Equishare users ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 100),
                CustomButton(
                  text: 'Become a Seller ',
                  color: AppColors.btncolor,
                  fontcolor: Colors.white,
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  },
                ),
                SizedBox(height: 12),
                CustomButton(
                  text: 'Continue As a User',
                  color: AppColors.btn2color,
                   fontcolor: Colors.black54,
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LOGIN()),
                  );
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