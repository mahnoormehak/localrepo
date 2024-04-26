// import 'package:flutter/material.dart';
// ignore: unused_import
// import 'package:localrepo/login%20screens/login.dart';
// import 'package:sqflite/sqflite.dart';

// import 'package:localrepo/homescreens/navbar.dart';
// import 'package:localrepo/homescreens/rentingitems.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: OnboardingScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:localrepo/routes.dart'; // Import the routes file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding, // Set initial route to onboarding
      routes: appRoutes,
    );
  }
}
