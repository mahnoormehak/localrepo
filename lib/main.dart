import 'package:flutter/material.dart';
import 'package:localrepo/login.dart';

import 'package:localrepo/signUP.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home:  signup(),
      debugShowCheckedModeBanner: false,
    );
  }
}
