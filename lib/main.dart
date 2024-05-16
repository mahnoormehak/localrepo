import 'package:flutter/material.dart';
import 'package:localrepo/routes.dart'; // Import the routes file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding, // Start from onboarding screen
      routes: AppRoutes.appRoutes, // Define all your routes
    );
  }
}
