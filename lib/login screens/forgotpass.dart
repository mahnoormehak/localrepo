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
final formkey = GlobalKey<FormState>();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
          
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40,25,40,80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
          // AnimatedTextKit(animatedTexts: [
          // RotateAnimatedText('Do you forget your Password??',
          //  textStyle: TextStyle(
          //           fontSize: 30.0,
          //           fontWeight: FontWeight.bold,
          //              fontStyle: FontStyle.italic,
                                        
          //                                color: const Color.fromARGB(255, 95, 67, 160),
          //         ),
          //         ),
          // RotateAnimatedText('Dont Worry',
          // textStyle: TextStyle(
          //           fontSize: 30.0,
          //           fontWeight: FontWeight.bold,
          //              fontStyle: FontStyle.italic,
                                        
          //                                color: const Color.fromARGB(255, 95, 67, 160),
          //         ),),
          
          // ]),
          
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
          //CustomTextField(controller: newpassController, text: 'New password ', icon: Icons.password),
               TextFormField(
                obscureText: !isVisible,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'password is required';
                  }
                  return null;
                },
                controller: newpassController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'new password',
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isVisible =!isVisible;

                    });
                  },
                    icon: Icon(
    isVisible ? Icons.visibility : Icons.visibility_off,
                  )
                  ),
                
                 enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.orange),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.purple),
          ),
          filled: true,
          fillColor: Colors.white,
                ),   
                
               ),   
              SizedBox(height: 20,),
        TextFormField(
                obscureText: !isVisible,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'password is required';
                  }
                  else if(newpassController.text!=confpassController){
                    return 'Password dont match';
                  }
                  return null;
                },
                controller: confpassController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Confirm password',
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isVisible =!isVisible;

                    });
                  },
                    icon: Icon(
    isVisible ? Icons.visibility : Icons.visibility_off,
                  )
                  ),
                
                 enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.orange),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.purple),
          ),
          filled: true,
          fillColor: Colors.white,
                ),   
                
               ),   
          
          
                   SizedBox(height: 40,),
                   CustomButton(text: 'Update', onPressed: (){
                    if(formkey.currentState!.validate()){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())); }
                    }
                    
                    ),
                 
               
                    ],
                  ),
                ),
                
              
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}