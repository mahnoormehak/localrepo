import 'package:flutter/material.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:localrepo/homescreens/navbar.dart';
import 'package:localrepo/login%20screens/forgotpass.dart';
import 'package:localrepo/login%20screens/signUP.dart';
import 'package:localrepo/onboarding_content/onboarding/data/data.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LOGIN extends StatelessWidget {
   LOGIN({super.key});

final emailController = TextEditingController();

final passwordController = TextEditingController();

 // Initial color
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
              body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 10,40,30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Welcome to Equishare living',
                    textStyle: TextStyle(
                                         fontSize: 27,
                                         fontStyle: FontStyle.italic,
                                         fontWeight: FontWeight.bold,
                                         color: const Color.fromARGB(255, 95, 67, 160),
                                       ),),
                    TyperAnimatedText('Your rental adventure begins here!!!!!',
                    textStyle: TextStyle(
                                        fontSize: 24,
                                         fontStyle: FontStyle.italic,
                                         fontWeight: FontWeight.bold,
                                         color: const Color.fromARGB(255, 95, 67, 160),
                                       ),),
                 
                  ],
                ),
                      SizedBox(height: 20,),
                      
            
            Container(
                 child: Center(
                   child: Lottie.asset(
                'assets/lotties/2.json',  // Adjust the path to match your animation file
                height: 250,  // Adjust the height as needed
                width: 350,
            ),
                 )
             ),   SizedBox(height: 20,),
              
                Text('Log in to your account and shape your rental lifestyle! ',
                  style:TextStyle(
                        fontSize: 17,
                       fontWeight: FontWeight.bold,
                   fontStyle: FontStyle.italic,
                   color: Color.fromARGB(255, 40, 143, 45),
                      )),
                    SizedBox(height: 10,),
               Container(
               
                  child: Column(
                children: [
                  // CustomTextField(controller: emailController, Text: 'Enter email'),
                  CustomTextField(controller: emailController, text: 'Enter email', icon:Icons.email, ),
                  SizedBox(height: 20,),
            // CustomTextField(controller: passwordController, Text: 'Enter password', ),
              CustomTextField(controller: emailController, text: 'Enter Password', icon:Icons.password, ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        
                                        TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotP()));
                    },
                    child: Text('Forget password?',
                        style: TextStyle(
                          
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 81, 100),
                        ),),
                  ),
                      ],
                    )
            
                 
                ],
                  ),
                ),
              //),
                SizedBox(height: 10,),
                CustomButton(text: 'Login', onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>LOGIN()),);
                }),
                 SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an account?',
                      style: TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.bold,
                      ),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                      }, 
                      child: Text('Sign up',
                      style:TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 81, 100),
                      )
                        ,)),
                      //  CustomButton(text: 'Sign Up', onPressed: (){})
                    ],
                  ),
                )
            
               
            
                ],
              ),
            ),
          ),
        )
    );
  }
}
          