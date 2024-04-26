import 'package:flutter/material.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/custom_widgets/textfield.dart';
// import 'package:localrepo/homescreens/navbar.dart';
import 'package:localrepo/login%20screens/forgotpass.dart';
import 'package:localrepo/login%20screens/signUP.dart';
import 'package:localrepo/routes.dart';
// import 'package:localrepo/onboarding_content/onboarding/data/data.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LOGIN extends StatelessWidget {
  LOGIN({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // Initial color
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
                      TyperAnimatedText(
                        'Your rental adventure begins here!!!!!',
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
                    height: 20,
                  ),

                  Center(
                    child: Lottie.asset(
                      'assets/lotties/2.json', // Adjust the path to match your animation file
                      height: 250, // Adjust the height as needed
                      width: 350,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                      'Log in to your account and shape your rental lifestyle! ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 40, 143, 45),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      // CustomTextField(controller: emailController, Text: 'Enter email'),
                      CustomTextField(
                        controller: emailController,
                        text: 'Enter email',
                        icon: Icons.email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // CustomTextField(controller: passwordController, Text: 'Enter password', ),
                      CustomTextField(
                        controller: emailController,
                        text: 'Enter Password',
                        icon: Icons.password,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const forgotP()));
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
                  //),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      // Perform login logic here
                      // If login is successful, navigate to the home screen
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont have an account?',
                          style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
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
                                color: Color.fromARGB(255, 255, 81, 100),
                              ),
                            )),
                        //  CustomButton(text: 'Sign Up', onPressed: (){})
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
