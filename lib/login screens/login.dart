import 'package:flutter/material.dart';
import 'package:localrepo/Database/authentication.dart';

import 'package:localrepo/custom_widgets/button.dart';

import 'package:localrepo/homescreens/home_screen.dart';

import 'package:localrepo/login%20screens/signUP.dart';

import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LOGIN extends StatefulWidget {
  const LOGIN({super.key});

  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isVisible = true;
  //  final LocalDatabase _localDatabase = LocalDatabase();
  void login() async {
    final form = formkey.currentState;
    if (form!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      // Retrieve user data from the database
      Map<String, dynamic> userData = await DBHelper.AuthenticateUser(email);

      // Check if user exists
      if (userData.isNotEmpty && userData['email'] == email) {
        // Use the updated password if available
        String storedPassword =
            userData['updatedPassword'] ?? userData['password'];

        // Compare stored password with entered password
        if (storedPassword == password) {
          // Passwords match, proceed with login
          // Show a snackbar for successful login
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Login successful!'),
              duration: const Duration(seconds: 3),
              backgroundColor: const Color.fromARGB(255, 247, 54, 96),
              behavior: SnackBarBehavior.floating,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              action: SnackBarAction(
                label: 'OK',
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          );
          // Navigate to the next screen after a short delay
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          });
        } else {
          // Passwords don't match, show error message
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(
                      color: Color.fromARGB(255, 43, 23, 114), width: 3),
                ),
                title: const Text("Incorrect Password"),
                content: const Text("The password you entered is incorrect!"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // User not found, show error message
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: const BorderSide(
                    color: Color.fromARGB(255, 43, 23, 114), width: 3),
              ),
              title: const Text("User Not Found"),
              content: const Text("No user found with the provided email!"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // AnimatedTextKit(
                //   animatedTexts: [
                //     TyperAnimatedText(
                //       'Welcome to Equishare living',
                //       textStyle: const TextStyle(
                //         fontSize: 27,
                //         fontStyle: FontStyle.italic,
                //         fontWeight: FontWeight.bold,
                //         color: Color.fromARGB(255, 95, 67, 160),
                //       ),
                //     ),
                //     TyperAnimatedText(
                //       'Your rental adventure begins here!!!!!',
                //       textStyle: const TextStyle(
                //         fontSize: 24,
                //         fontStyle: FontStyle.italic,
                //         fontWeight: FontWeight.bold,
                //         color: Color.fromARGB(255, 95, 67, 160),
                //       ),
                //     ),
                //   ],
                // ),
                    AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Welcome to Equishare living',
                      textStyle: const TextStyle(
                        fontSize: 27,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 67, 160),
                      ),
                    ),
                  ]),
           
                Text(  'Your rental adventure begins here!!!!!',
                style: const TextStyle(
                        fontSize: 19,),),
                const SizedBox(height: 20),
                Center(
                  child: Lottie.asset(
                    'assets/lotties/2.json', // Adjust the path to match your animation file
                    height: 250, // Adjust the height as needed
                    width: 350,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Log in to your account and shape your rental lifestyle! ',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 40, 143, 45),
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Enter Email Address',
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
                          )),
                      const SizedBox(height: 15),
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

                      //   SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const signup()));
                            },
                            child: const Text(
                              'Forget password?',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 81, 100),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    login();
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LOGIN(key: null,)));
                  },
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont have an account?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const signup()));
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            //   color: Color.fromARGB(255, 255, 81, 100),
                          ),
                        ),
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
