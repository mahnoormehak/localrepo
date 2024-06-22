
// import 'package:flutter/material.dart';
// import 'package:localrepo/Database/authentication.dart';
// import 'package:localrepo/custom_widgets/button.dart';
// import 'package:localrepo/homescreens/home_screen.dart';
// import 'package:localrepo/profile/profile_screen.dart';
// import 'package:lottie/lottie.dart';

// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({Key? key}) : super(key: key);

//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   final newpassController = TextEditingController();
//   final confpassController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   bool isVisible = true;

//   @override
//   void dispose() {
//     newpassController.dispose();
//     confpassController.dispose();
//     super.dispose();
//   }

//   void updatePassword(BuildContext context) async {
//     if (!formKey.currentState!.validate()) {
//       return;
//     }

//     String newPassword = newpassController.text;
//     String confPassword = confpassController.text;

//     // Check if newPassword and confPassword match
//     if (newPassword != confPassword) {
//       showSnackBar('Passwords do not match.');
//       return;
//     }

//     // Check if newPassword meets any additional criteria (e.g., length)
//     if (newPassword.length < 8) {
//       showSnackBar('Password must be at least 8 characters long.');
//       return;
//     }

//     // Show loading indicator
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );

//     try {
//       // Store the updated password in the database
//       await DBHelper.updatePassword(newPassword, confPassword);
//       if (mounted) Navigator.of(context, rootNavigator: true).pop(); // Hide loading indicator
//       showSnackBar('Password updated successfully!');
//       if (mounted) Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => const Profile()));
//     } catch (e) {
//       if (mounted) Navigator.of(context, rootNavigator: true).pop(); // Hide loading indicator
//       showSnackBar('Failed to update password. Please try again.');
//       // You can also print or log the error for debugging purposes
//       print('Error updating password: $e');
//     }
//   }

//   void showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         duration: const Duration(seconds: 1),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(40, 0, 40, 80),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Do you forget your password???',
//                     style: TextStyle(
//                       fontSize: 27,
//                       fontStyle: FontStyle.italic,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 117, 160, 67),
//                     ),
//                   ),
//                   const Text(
//                     'Don’t worry',
//                     style: TextStyle(
//                       fontSize: 27,
//                       fontStyle: FontStyle.italic,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 95, 67, 160),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   Center(
//                     child: Lottie.asset(
//                       'assets/lotties/3.json', // Adjust the path to match your animation file
//                       height: 300, // Adjust the height as needed
//                       width: 500,
//                     ),
//                   ),
//                   const Text(
//                     'Refresh your password now',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontStyle: FontStyle.italic,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 95, 67, 160),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     obscureText: !isVisible,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Password is required';
//                       }
//                       return null;
//                     },
//                     controller: newpassController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.lock),
//                       labelText: 'New password',
//                       suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             isVisible = !isVisible;
//                           });
//                         },
//                         icon: Icon(
//                           isVisible ? Icons.visibility : Icons.visibility_off,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(40),
//                         borderSide: const BorderSide(color: Colors.orange),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(40),
//                         borderSide: const BorderSide(color: Colors.purple),
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     obscureText: !isVisible,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Password is required';
//                       } else if (newpassController.text != confpassController.text) {
//                         return 'Passwords do not match';
//                       }
//                       return null;
//                     },
//                     controller: confpassController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.lock),
//                       labelText: 'Confirm password',
//                       suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             isVisible = !isVisible;
//                           });
//                         },
//                         icon: Icon(
//                           isVisible ? Icons.visibility : Icons.visibility_off,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(40),
//                         borderSide: const BorderSide(color: Colors.orange),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(40),
//                         borderSide: const BorderSide(color: Colors.purple),
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   CustomButton(
//                     text: 'Update',
//                     onPressed: () {
//                       updatePassword(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:localrepo/user_side/Database/authentication.dart';
import 'package:localrepo/user_side/custom_widgets/button.dart';
import 'package:localrepo/user_side/homescreens/home_screen.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final newpassController = TextEditingController();
  final confpassController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isVisible = true;
  bool isLoading = false;

  @override
  void dispose() {
    newpassController.dispose();
    confpassController.dispose();
    super.dispose();
  }

  void updatePassword(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

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

    setState(() {
      isLoading = true;
    });

    try {
      // Store the updated password in the database
      await DBHelper.updatePassword(newPassword,confPassword,);
      if (mounted) {
        showSnackBar('Password updated successfully!');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    } catch (e) {
      if (mounted) {
        showSnackBar('Failed to update password. Please try again.');
        // You can also print or log the error for debugging purposes
        print('Error updating password: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Do you forget your password???',
                    style: TextStyle(
                      fontSize: 27,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 117, 160, 67),
                    ),
                  ),
                  const Text(
                    'Don’t worry',
                    style: TextStyle(
                      fontSize: 27,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 95, 67, 160),
                    ),
                  ),
                  const SizedBox(height: 30),
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
                  TextFormField(
                    obscureText: !isVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    controller: newpassController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'New password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
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
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: !isVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (newpassController.text != confpassController.text) {
                        return 'Passwords do not match';
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
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
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
                  const SizedBox(height: 40),
                  isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: 'Update',
                          onPressed: () {
                            updatePassword(context);
                          },
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

