import 'dart:math';
import 'package:flutter/material.dart';
import 'package:localrepo/Database/authentication.dart';
import 'package:localrepo/Database/uploadScreen/productlist.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/login%20screens/IDcard.dart';

// import 'package:localrepo/custom_widgets/checkbox.dart';
import 'package:localrepo/login%20screens/login.dart';
import 'package:localrepo/profile/profile_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool isVisible = true;
  late DBHelper dbhelper;

  @override
  void initState() {
    super.initState();
    dbhelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            'Create an Account',
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 95, 67, 160),
                            ),
                          ),
                          TyperAnimatedText(
                            'Embark on a seamless renting experience',
                            textStyle: const TextStyle(
                              fontSize: 23,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 95, 67, 160),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Lottie.asset(
                  "assets/lotties/7.json",
                  height: 200.0,
                  width: 330.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0,0,10,0),
                  child: Text('Please fill in the form below to create a new account and start using this application.',  style: TextStyle(
                            fontSize: 17,
                            
                            //   color: Color.fromARGB(255, 255, 81, 100),
                          ),),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: firstnamecontroller,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          prefixIcon: const Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Colors.orange, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Colors.purple, width: 3),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: lastnamecontroller,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: const Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Colors.orange, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Colors.purple, width: 3),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Colors.orange, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Colors.purple, width: 3),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Email Address',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: !isVisible,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: ' Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: Icon(
                              isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Colors.orange, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Colors.purple, width: 3),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: const Icon(Icons.phone),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Colors.orange, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Colors.purple, width: 3),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                CustomButton(
                  text: 'Create an Account',
                  onPressed: () {
                    _handleSignup(context);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LOGIN()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 81, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  bool validatePhoneNumber(String phone) {
    final phoneRegExp = RegExp(r'^\d{11}$');
    return phoneRegExp.hasMatch(phone);
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.black),
        ),
       backgroundColor: Color.fromARGB(255, 243, 146, 186),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  void _handleSignup(BuildContext context) {
    if (formkey.currentState!.validate()) {
      String firstName = firstnamecontroller.text;
      String lastName = lastnamecontroller.text;
      String email = emailController.text;
      String password = passwordController.text;
      String phone = phoneController.text;

      // Validate email
      if (!validateEmail(email)) {
        showSnackBar(context, 'Invalid email address');
        return;
      }

      // Validate phone number
      if (!validatePhoneNumber(phone)) {
        showSnackBar(context, 'Phone number must be exactly 11 digits long');
        return;
      }

      // Check for password length
      if (password.length < 8) {
        showSnackBar(context, 'Password must be at least 8 characters long');
        return;
      }

      // Proceed with saving data to the database
      _saveUserData(context, firstName, lastName, email, password, phone);
    }
  }

  void _saveUserData(BuildContext context, String firstName, String lastName,
      String email, String password, String phone) async {
    try {
      // Save user data to the database
      await DBHelper.insertAndFetchUser({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'phone': phone,
      });

      //  _showSnackBar('Signup successful');
      print('signup successful');
      // Navigate to the profile screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Profile()),
      );
    } catch (e) {
      // Handle any errors that occur during database operation
      //   _showSnackBar('Failed to save user data. Please try again.');
      print('Error saving user data: $e');
    }
  }
}
