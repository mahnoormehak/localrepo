import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/seller_side/database/sellerinfo_db.dart';
import 'package:localrepo/seller_side/screens/login/resetpassword.dart';
import 'package:localrepo/seller_side/screens/register/stepper.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/button.dart';
import 'package:localrepo/seller_side/widgets/hyperlinkedtext.dart';
import 'package:localrepo/seller_side/widgets/navbar.dart';
import 'package:localrepo/seller_side/widgets/passwordfield.dart';
import 'package:localrepo/seller_side/widgets/textfield.dart';
import 'package:lottie/lottie.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Check if it's a valid email address
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      // Validate credentials against SQLite database
      bool isAuthenticated = await DatabaseHelper().loginUser(
        email: emailController.text,
        password: passwordController.text,
      );

      if (isAuthenticated) {
        Get.snackbar('Success', 'Login successful');
        // Navigate to home or dashboard screen
      } else {
        Get.snackbar('Error', 'Invalid email or password');
      }
    }
  }
}

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Center(
          child: Form(
            key: loginController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome back Seller ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Login with your password",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Center(
                  child: Lottie.asset(
                    'assets/lotties/2.json',
                    height: 300,
                    width: 450,
                  ),
                ),
                SizedBox(height: 60),
                CustomTextField(
                  controller: loginController.emailController,
                  labelText: 'Email',
                  validator: loginController.validateEmail,
                  onChanged: (value) {}, icon: Icons.email,
                ),
                SizedBox(height: 20),
                CustomPasswordField(
                  controller: loginController.passwordController,
                  labelText: 'Password',
                  validator: PasswordValidator.validatePassword,
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        text: 'Login',
                        color: AppColors.btncolor,
                        fontcolor: Colors.white,
                        onPressed:(){ 
                          loginController.login;
                          Get.to(()=>NavBarScreen());
                        } 
                      ),
                      SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an Account?  ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'SignUp',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => SignupStepperAlternative());
                                },
                            ),
                          ],
                        ),
                      ),
                      HyperlinkText(
                        text: 'Forgot Password?',
                        onTap: () {
                          Get.to(() => ForgetPasswordScreen());
                        },
                      ),
                    ],
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
