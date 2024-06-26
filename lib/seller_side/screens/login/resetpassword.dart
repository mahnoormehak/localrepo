import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/seller_side/database/sellerinfo_db.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/button.dart';
import 'package:localrepo/seller_side/widgets/passwordfield.dart';
import 'package:localrepo/seller_side/widgets/textfield.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController idCardController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? validateIdCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'ID card number cannot be empty';
    }
    // Add your specific validation logic for ID card number format
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password cannot be empty';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void resetPassword() async {
    // Validate ID card number against SQLite database
    bool isValidIdCard = await DatabaseHelper().validateIdCard(
      idNumber: idCardController.text,
    );

    if (!isValidIdCard) {
      Get.snackbar('Error', 'Invalid ID card number');
      return;
    }

    // Proceed with password reset
    if (formKey.currentState!.validate()) {
      Get.snackbar('Success', 'Password reset successful');
      // Implement logic to update password in SQLite database
    }
  }
}

class ForgetPasswordScreen extends StatelessWidget {
  final ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Center(
          child: Form(
            key: forgetPasswordController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Please enter your ID card number",
                  style: TextStyle(fontSize: 18),
                ),
                //SizedBox(height: 20),
                const SizedBox(height: 30),
                  Center(
                    child: Lottie.asset(
                      'assets/lotties/3.json', // Adjust the path to match your animation file
                      height: 300, // Adjust the height as needed
                      width: 500,
                    ),
                  ),
                // CustomTextField(
                //   controller: forgetPasswordController.idCardController,
                //   labelText: 'ID Card Number',
                //   validator: forgetPasswordController.validateIdCard, onChanged: (value) {  }, icon: Icons.,
                // ),
                SizedBox(height: 20),
                CustomPasswordField(
                  controller: forgetPasswordController.passwordController,
                  labelText: 'New Password',
                  validator: PasswordValidator.validatePassword, onChanged: (value) {  },
                ),
                SizedBox(height: 20),
                CustomPasswordField(
                  controller:
                      forgetPasswordController.confirmPasswordController,
                  labelText: 'Confirm Password',
                  validator: forgetPasswordController.validateConfirmPassword, onChanged: (value) {  },
                ),
                SizedBox(height: 20),
                Center(
                  child: CustomButton(
                    text: 'Reset Password',
                    color: AppColors.btncolor,
                    fontcolor: Colors.white,
                    onPressed: forgetPasswordController.resetPassword,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
