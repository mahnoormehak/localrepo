
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// // ignore: depend_on_referenced_packages
// import 'package:localrepo/Database/authentication.dart';
// import 'package:localrepo/custom_widgets/button.dart';

// class EditScreen extends StatefulWidget {
//   const EditScreen({super.key});

//   @override
//   State<EditScreen> createState() => _EditScreenState();
// }

// class _EditScreenState extends State<EditScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final nameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final phoneNumberController = TextEditingController();

//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Center(
//           child: Text('Profile'),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               Center(
//                 child: Stack(
//                   children: [
//                     Text(
//                       'Update Your Personal details',
//                       style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 70),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: nameController,
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.person),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                             borderSide: const BorderSide(color: Colors.orange, width: 2),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                             borderSide: const BorderSide(color: Colors.purple, width: 3),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelText: 'Full Name',
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your full name';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       TextFormField(
//                         controller: lastNameController,
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.person),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                             borderSide: const BorderSide(color: Colors.orange, width: 2),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                             borderSide: const BorderSide(color: Colors.purple, width: 3),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelText: 'Last Name',
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your last name';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       TextFormField(
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.email),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                             borderSide: const BorderSide(color: Colors.orange, width: 2),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                             borderSide: const BorderSide(color: Colors.purple, width: 3),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelText: 'Email',
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
//                           final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//                           if (!emailRegex.hasMatch(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       TextFormField(
//                         controller: passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.lock),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                             borderSide: const BorderSide(color: Colors.orange, width: 2),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                             borderSide: const BorderSide(color: Colors.purple, width: 3),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelText: 'Password',
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           if (value.length < 8) {
//                             return 'Password must be at least 8 characters';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       TextFormField(
//                         controller: phoneNumberController,
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.phone),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                             borderSide: const BorderSide(color: Colors.orange, width: 2),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                             borderSide: const BorderSide(color: Colors.purple, width: 3),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelText: 'Phone Number',
//                         ),
//                         keyboardType: TextInputType.phone,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your phone number';
//                           }
//                           if (value.length != 11) {
//                             return 'Phone number must be 11 digits';
//                           }
//                           return null;
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Expanded(
//                       child: CustomButton(
//                         text: 'Cancel',
//                         onPressed: () {
//                           nameController.clear();
//                           lastNameController.clear();
//                           emailController.clear();
//                           passwordController.clear();
//                           phoneNumberController.clear();
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: CustomButton(
//                         text: 'Save',
//                         onPressed: () async {
//                           if (_formKey.currentState?.validate() ?? false) {
//                             _updateUserData();
//                           } else {
//                             _showSnackBar('Please fix the errors in the form');
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Method to update user data in the database
//   void _updateUserData() async {
//     // Get the updated values from text field controllers
//     String name = nameController.text;
//     String lastName = lastNameController.text;
//     String email = emailController.text;
//     String password = passwordController.text;
//     String phone = phoneNumberController.text;

//     // Prepare data to update
//     Map<String, dynamic> userData = {
//       'firstName': name,
//       'lastName': lastName,
//       'email': email,
//       'password': password,
//       'phone': phone,
//     };

//     // Update user data in the database
//     await DBHelper.insertAndFetchUser(userData);

//     // Navigate back to profile screen and pass the updated data
//     Navigator.pop(context, userData);
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: depend_on_referenced_packages
import 'package:localrepo/Database/authentication.dart';
import 'package:localrepo/custom_widgets/button.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
 
void _showSnackBar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
       backgroundColor: Color.fromARGB(255, 243, 146, 186),
      elevation: 6.0,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {
          // Hide the snackbar manually if needed
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Profile'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Text(
                      'Update Your Personal details',
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.orange, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.purple, width: 3),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Full Name',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.orange, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.purple, width: 3),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Last Name',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.orange, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.purple, width: 3),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.orange, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.purple, width: 3),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.orange, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.purple, width: 3),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Phone Number',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Cancel',
                        onPressed: () {
                          nameController.clear();
                          lastNameController.clear();
                          emailController.clear();
                          passwordController.clear();
                          phoneNumberController.clear();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Save',
                        onPressed: () {
                          if (phoneNumberController.text.length != 11) {
                            _showSnackBar('Phone number must be 11 digits');
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)) {
                            _showSnackBar('Please enter a valid email');
                          } else if (passwordController.text.length < 8) {
                            _showSnackBar('Password must be at least 8 characters');
                          } else {
                            _updateUserData();
                          }
                        },
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

  // Method to update user data in the database
  void _updateUserData() async {
    // Get the updated values from text field controllers
    String name = nameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String phone = phoneNumberController.text;

    // Prepare data to update
    Map<String, dynamic> userData = {
      'firstName': name,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
    };

    // Update user data in the database
    await DBHelper.insertAndFetchUser(userData);

    // Navigate back to profile screen and pass the updated data
    Navigator.pop(context, userData);
  }
}
