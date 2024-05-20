//
import 'package:flutter/material.dart';
import 'package:localrepo/Database/authentication.dart';
import 'package:localrepo/custom_widgets/button.dart';
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
  // const signup({super.key});
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController firstnamecontroller = TextEditingController();

  final TextEditingController lastnamecontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool isVisible = true;
  late DBHelper dbhelper;
  // Declare LocalDatabase instance

  @override
  void initState() {
    super.initState();

    dbhelper = DBHelper();
    // Initialize LocalDatabase instance
    // localDatabase.initializeDatabase(); // Initialize the database
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
                            'Signup',
                            textStyle: const TextStyle(
                              fontSize: 27,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 95, 67, 160),
                            ),
                          ),
                          TyperAnimatedText(
                            'Enmark on a seamless renting experience',
                            textStyle: const TextStyle(
                              fontSize: 25,
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
                  height: 300.0,
                  width: 330.0,
                ),

                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 5, 40, 10),
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
                          )),
                      const SizedBox(
                        height: 10,
                      ),
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
                          )),
                      const SizedBox(
                        height: 10,
                      ),
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
                            labelText: 'Email Address'),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter your email address';
                        //   } else if (!isValidEmail(value)) {
                        //     return 'Please enter a valid email address';
                        //   }
                        //   // You can add more validation checks for email format
                        //   return null;
                        // },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: !isVisible,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password is required';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
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
                      const SizedBox(
                        height: 10,
                      ),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          } else if (value.length < 10) {
                            return 'Phone number must be at least 10 digits long';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                //SizedBox(height: 10,),
                CustomButton(
                    text: 'Signup',
                    onPressed: () async {
                      //    _handleSignup();
                      await DBHelper.insertAndFetchUser({
                        'firstName': firstnamecontroller.text,
                        'lastName': lastnamecontroller.text,
                        'email': emailController.text,
                        'password': passwordController.text,
                        'phone': phoneController.text,
                      });

                      // Navigate to the profile screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()),
                      );
                    }),
                // SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //    Checkbox(value: value, onChanged: onChanged),
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
                              MaterialPageRoute(
                                  builder: (context) => const LOGIN()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 81, 0),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //  bool isValidEmail(String email) {
  //   final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  //   return emailRegex.hasMatch(email);
  // }

  // ignore: unused_element
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleSignup() {
    if (formkey.currentState!.validate()) {
      // Validation passed, proceed with signup
      String firstName = firstnamecontroller.text;
      String lastName = lastnamecontroller.text;
      String email = emailController.text;
      String password = passwordController.text;
      String phone = phoneController.text;
      void showSnackBar(String message) {
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 2),
          ),
        );
      }

      // Check for password length
      if (password.length < 8) {
        showSnackBar('Password must be at least 8 characters long');
        return;
      }

      // Check for phone number length
      if (phone.length < 10) {
        showSnackBar('Phone number must be at least 10 digits long');
        return;
      }

      // Proceed with saving data to the database
      _saveUserData(firstName, lastName, email, password, phone);
    }
  }

  void _saveUserData(String firstName, String lastName, String email,
      String password, String phone) async {
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
        context as BuildContext,
        MaterialPageRoute(builder: (context) => const Profile()),
      );
    } catch (e) {
      // Handle any errors that occur during database operation
      //   _showSnackBar('Failed to save user data. Please try again.');
      print('Error saving user data: $e');
    }
  }
}
