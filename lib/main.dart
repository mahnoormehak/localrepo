import 'package:flutter/material.dart';
import 'package:localrepo/homescreens/categories.dart';

import 'package:localrepo/homescreens/navbar.dart';
// import 'package:localrepo/homescreens/rentingitems.dart';
import 'package:localrepo/login%20screens/forgotpass.dart';
import 'package:localrepo/login%20screens/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home: HomeScreen (),
      debugShowCheckedModeBanner: false,
    );
  }
}
