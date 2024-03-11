import 'package:flutter/material.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:localrepo/homescreens/navbar.dart';
// import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';



class forgotP extends StatefulWidget {
   forgotP({super.key});

  @override
  State<forgotP> createState() => _forgotPState();
}

class _forgotPState extends State<forgotP> {
  final newpassController = TextEditingController();

final confpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40,25,40,80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      
AnimatedTextKit(animatedTexts: [
RotateAnimatedText('Do you forget your Password??',
 textStyle: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                     fontStyle: FontStyle.italic,
                                      
                                       color: const Color.fromARGB(255, 95, 67, 160),
                ),
                ),
RotateAnimatedText('Dont Worry',
textStyle: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                     fontStyle: FontStyle.italic,
                                      
                                       color: const Color.fromARGB(255, 95, 67, 160),
                ),),

]),

SizedBox(height: 30,),


Container(
     child: Center(
       child: Lottie.asset(
              'assets/lotties/3.json',  // Adjust the path to match your animation file
              height: 300,  // Adjust the height as needed
              width: 500,
          ),
     )
 ),  
              Text('Refresh your password now',
              style: TextStyle(
                fontSize: 20,
                                                     fontStyle: FontStyle.italic,
                                       fontWeight: FontWeight.bold,
                                       color: const Color.fromARGB(255, 95, 67, 160),
               
              ),),
              SizedBox(height: 20),

              Container(
                child: Column(
                
                  children: [
CustomTextField(controller: newpassController, text: 'New password ', icon: Icons.password),
                   
            SizedBox(height: 20,),
              CustomTextField(controller: confpassController,  text: 'Confirm password',icon: Icons.password_outlined),
                 SizedBox(height: 40,),
                 CustomButton(text: 'Update', onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())); }
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
}