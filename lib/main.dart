import 'package:flutter/material.dart';
import 'package:fyp/folders/custext.dart';
import 'package:fyp/folders/custom.dart';
import 'package:fyp/hello.dart';
// import 'custom_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    final TextEditingController customController = TextEditingController();

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
     
     SizedBox(height: 15,),
     Text(' write another custom button'),
          SizedBox(height: 15,),
    
   
      
Container(
height: 250,
width: 440,
   child:   Column(
    children:[
      CustomTextField(controller: customController, Text: 'enter email'),
         SizedBox(height: 15,),
         CustomTextField(controller: customController, Text: 'enter password'),
         SizedBox(height: 15,),
         CustomTextField(controller: customController, Text: 'enter phone number')
    ]
  
)
),

CustomButton(text: 'Login', onPressed: (){}),
SizedBox(height: 40,),
Container(
  
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      // Padding(padding: EdgeInsets.all(20)),
      Text('Have an account?'),
      SizedBox(width: 30,),
      CustomButton(text: 'sign up', onPressed: (){})
    ],
  ),
)
            ],
          ),
        ),
      ),
    );
  }
}