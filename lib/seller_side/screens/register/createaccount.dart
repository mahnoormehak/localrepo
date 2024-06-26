import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/seller_side/providers/sellerinfo_controller.dart';
import 'package:localrepo/seller_side/screens/login/login.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/button.dart';
//import 'package:localrepo/seller_side/widgets/button.dart';
import 'package:localrepo/seller_side/widgets/passwordfield.dart';
import 'package:localrepo/seller_side/widgets/textfield.dart';
//import 'package:localrepo/user_side/custom_widgets/button.dart';

class CreateAccount extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  // Creating the TextEditingController instances once
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  CreateAccount() {
    // Initialize the controllers with current values
    emailController.text = userController.email.value;
    passwordController.text = userController.password.value;
    confirmPasswordController.text = userController.confirmPassword.value;

    // Add listeners to update the userController values when text changes
    emailController.addListener(() {
      userController.email.value = emailController.text;
    });
    passwordController.addListener(() {
      userController.password.value = passwordController.text;
    });
    confirmPasswordController.addListener(() {
      userController.confirmPassword.value = confirmPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0), // Adjusted vertical padding
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Step 1/4",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Create an Account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Set up an email and password",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                labelText: 'Enter email',
                validator: userController.validateEmail,
                onChanged: (value) {
                  userController.email.value = value;
                }, icon: Icons.email,
              ),
              SizedBox(height: 20),
              CustomPasswordField(
                controller: passwordController,
                labelText: 'Enter password',
                onChanged: (value) {
                  userController.password.value = value;
                },
              ),
              SizedBox(height: 20),
              CustomPasswordField(
                controller: confirmPasswordController,
                labelText: 'Confirm password',
                validator: userController.validateConfirmPassword,
                onChanged: (value) {
                  userController.confirmPassword.value = value;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Agree & Create Account',
                      onPressed: () => userController.createUser(),
                      color: AppColors.btncolor,
                      fontcolor: Colors.white,
                    ),
                    SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to LoginScreen
                                Get.to(()=>LoginScreen()); // Adjust the route as per your setup
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
