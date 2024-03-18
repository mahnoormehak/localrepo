import 'package:flutter/material.dart';
import 'package:localrepo/login%20screens/login.dart';
import 'package:sqflite/sqflite.dart';


import 'package:localrepo/homescreens/navbar.dart';
import 'package:localrepo/onboarding_content/onboarding/screens/onboarding.dart';
// import 'package:localrepo/homescreens/rentingitems.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  OnboardingScreen(),
    );
  }
}
