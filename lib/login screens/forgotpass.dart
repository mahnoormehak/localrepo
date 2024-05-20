// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:localrepo/Database/authentication.dart';
import 'package:localrepo/custom_widgets/button.dart';

import 'package:localrepo/homescreens/home_screen.dart';

// import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class forgotP extends StatefulWidget {
  const forgotP({super.key});

  @override
  State<forgotP> createState() => _forgotPState();
}

class _forgotPState extends State<forgotP> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final newpassController = TextEditingController();
  final confpassController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool isVisible = true;
  void updatePassword(BuildContext context) async {
    String newPassword = newpassController.text;
    String confPassword = confpassController.text;

    // Check if newPassword and confPassword match
    if (newPassword != confPassword) {
      showSnackBar('Passwords do not match.');
      return;
    }

    // Check if newPassword meets any additional criteria (e.g., length)
    if (newPassword.length < 8) {
      showSnackBar('Password must be at least 8 characters long.');
      return;
    }
// Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Store the updated password in the database
    try {
      // Store the updated password in the database
      await DBHelper.updatePassword(newPassword);
      // Hide loading indicator
      Navigator.of(context, rootNavigator: true).pop();
      showSnackBar('Password updated successfully!');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } catch (e) {
      // Hide loading indicator
      Navigator.of(context, rootNavigator: true).pop();
      showSnackBar('Failed to update password. Please try again.');
      // You can also print or log the error for debugging purposes
      print('Error updating password: $e');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: navigatorKey,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Do you forget your password???',
                        textStyle: const TextStyle(
                          fontSize: 27,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 67, 160),
                        ),
                      ),
                      TyperAnimatedText(
                        'Dont',
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 67, 160),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Lottie.asset(
                      'assets/lotties/3.json', // Adjust the path to match your animation file
                      height: 300, // Adjust the height as needed
                      width: 500,
                    ),
                  ),
                  const Text(
                    'Refresh your password now',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 95, 67, 160),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      //CustomTextField(controller: newpassController, text: 'New password ', icon: Icons.password),
                      TextFormField(
                        obscureText: !isVisible,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password is required';
                          }
                          return null;
                        },
                        controller: newpassController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: 'new password',
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
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: !isVisible,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password is required';
                            // ignore: unrelated_type_equality_checks
                          } else if (newpassController.text !=
                              confpassController) {
                            return 'Password dont match';
                          }
                          return null;
                        },
                        controller: confpassController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: 'Confirm password',
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
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                          text: 'Update',
                          onPressed: () {
                            updatePassword(context);
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
