<<<<<<< HEAD
// ignore_for_file: camel_case_types
=======
// ignore_for_file: use_build_context_synchronously
>>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321

import 'package:flutter/material.dart';
import 'package:localrepo/Database/authentication.dart';
import 'package:localrepo/custom_widgets/button.dart';
<<<<<<< HEAD
import 'package:localrepo/homescreens/home_screen.dart';
// import 'package:localrepo/custom_widgets/textfield.dart';
// import 'package:localrepo/homescreens/sidebar.dart';
=======
import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:localrepo/homescreens/navbar.dart';
import 'package:localrepo/login%20screens/login.dart';
>>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
// import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:lottie/lottie.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

// ignore: duplicate_ignore
// ignore: camel_case_types
class forgotP extends StatefulWidget {
  const forgotP({super.key});

  @override
  State<forgotP> createState() => _forgotPState();
}

class _forgotPState extends State<forgotP> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final newpassController = TextEditingController();
<<<<<<< HEAD
  final confpassController = TextEditingController();
  final formkey = GlobalKey<FormState>();
=======
final confpassController = TextEditingController();
final formkey = GlobalKey<FormState>();

>>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
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
      return Center(
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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
      duration: Duration(seconds: 2),
    ),
  );
}
 

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: Colors.white,
=======
    return  Scaffold(
      key: navigatorKey,
    backgroundColor: Colors.white,
>>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
<<<<<<< HEAD
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 25, 40, 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // AnimatedTextKit(animatedTexts: [
                  // RotateAnimatedText('Do you forget your Password??',
                  //  textStyle: TextStyle(
                  //           fontSize: 30.0,
                  //           fontWeight: FontWeight.bold,
                  //              fontStyle: FontStyle.italic,
=======
          
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40,20,40,80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Do you forget your password???',
                      textStyle: TextStyle(
                        fontSize: 27,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 95, 67, 160),
                      ),
                    ),
                    TyperAnimatedText(
                      'Dont',
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 95, 67, 160),
                      ),
                      
                    ),
                    
                  ],
                ),
          SizedBox(height: 30,),
          Container(
               child: Center(
                 child: Lottie.asset(
                'assets/lotties/3.json',  // Adjust the path to match your animation file
                height: 300,  // Adjust the height as needed
                width: 500,
            ),
               )
           ),  
                Text('Refresh your password now',
                style: TextStyle(
                  fontSize: 20,
                                                       fontStyle: FontStyle.italic,
                                         fontWeight: FontWeight.bold,
                                         color: const Color.fromARGB(255, 95, 67, 160),
                 
                ),),
                SizedBox(height: 20),
          
                Container(
                  child: Column(
                  
                    children: [
          //CustomTextField(controller: newpassController, text: 'New password ', icon: Icons.password),
               TextFormField(
                obscureText: !isVisible,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'password is required';
                  }
                  return null;
                },
                controller: newpassController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'new password',
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isVisible =!isVisible;
>>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321

                  //                                color: const Color.fromARGB(255, 95, 67, 160),
                  //         ),
                  //         ),
                  // RotateAnimatedText('Dont Worry',
                  // textStyle: TextStyle(
                  //           fontSize: 30.0,
                  //           fontWeight: FontWeight.bold,
                  //              fontStyle: FontStyle.italic,

                  //                                color: const Color.fromARGB(255, 95, 67, 160),
                  //         ),),

                  // ]),

                  const SizedBox(
                    height: 30,
                  ),
<<<<<<< HEAD

                  Center(
                    child: Lottie.asset(
                      'assets/lotties/3.json', // Adjust the path to match your animation file
                      height: 300, // Adjust the height as needed
                      width: 500,
=======
                
                 enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.orange),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.purple),
          ),
          filled: true,
          fillColor: Colors.white,
                ),   
                
               ),   
          
          
                   SizedBox(height: 40,),
                   CustomButton(text: 'Update', onPressed: (){
                    updatePassword(context);
                   }
                  
                    
>>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321
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
                            if (formkey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            }
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
