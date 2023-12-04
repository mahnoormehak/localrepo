import 'package:flutter/material.dart';
import 'package:fyp/folders/custom.dart';
// import 'custom_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Button Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
     CustomButton(text: 'my login button', onPressed: (){}),
     SizedBox(height: 15,),
     Text(' write another custom button'),
          SizedBox(height: 15,),
     CustomButton(text: 'sign up', onPressed: (){})
            ],

          ),
        ),
      ),
    );
  }
}