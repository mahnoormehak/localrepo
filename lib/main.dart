import 'package:flutter/material.dart';
import 'package:localrepo/homescreens/categories.dart';

import 'package:localrepo/homescreens/navbar.dart';
import 'package:localrepo/homescreens/rentingitems.dart';


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
