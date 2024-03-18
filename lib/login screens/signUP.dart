import 'package:flutter/material.dart';
import 'package:localrepo/custom_widgets/button.dart';
// import 'package:localrepo/custom_widgets/checkbox.dart';
import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:localrepo/homescreens/navbar.dart';
import 'package:localrepo/login%20screens/forgotpass.dart';
import 'package:localrepo/login%20screens/login.dart';
import 'package:localrepo/login%20screens/splash.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  // const signup({super.key});
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController firstnamecontroller = TextEditingController();

  final TextEditingController lastnamecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child : Form(
            key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           
                   Center(
                     child: Column(
                       children: [
                      
                      
            AnimatedTextKit(
                animatedTexts: [
          TyperAnimatedText('Signup',
          textStyle: TextStyle(
                                         fontSize: 27,
                                         fontStyle: FontStyle.italic,
                                         fontWeight: FontWeight.bold,
                                         color: const Color.fromARGB(255, 95, 67, 160),
                                       ),),
          TyperAnimatedText('Enmark on a seamless renting experience',
          textStyle: TextStyle(
                                        fontSize: 25,
                                         fontStyle: FontStyle.italic,
                                         fontWeight: FontWeight.bold,
                                         color: const Color.fromARGB(255, 95, 67, 160),
                                       ),),  ], ),
            
                       ],
                       
                     ),
                
                
                   ),
             
                         Lottie.asset(
            "assets/lotties/7.json",
            height: 300.0,
            width: 330.0,
          ),
             
                SizedBox(height: 5,),
                Container(
                  
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(40,5,40,10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CustomTextField(controller: firstnamecontroller, text: 'First Name', icon: Icons.person),
          SizedBox(height: 10,),
                                                          CustomTextField(controller: emailController, text: 'Emai Address', icon: Icons.email),
                                                          SizedBox(height: 10,),
                                                         
                                                            TextFormField(
                  obscureText: !isVisible,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'password is required';
                    }
                    return null;
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: ' Password',
                    suffixIcon: IconButton(
                      onPressed: (){
                      setState(() {
                        isVisible =!isVisible;
                      });
                    },
                      icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
                    ),
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
                                                           
                                                            SizedBox(height: 10,),
                                                                CustomTextField(controller: phoneController, text: 'Phone number', icon: Icons.phone),
                                          
                                              SizedBox(height: 10,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  
            //  checkboxx(),                                 //    Checkbox(value: value, onChanged: onChanged),
          Text('Agree with terms and conditions',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),)
                                                ],
                                              ),
                                                  ],
                                              
                                                ),
                                ),
                ),
                 SizedBox(height: 10,),
                CustomButton(text: 'Signup', onPressed: (){
                 
                   if(formkey.currentState!.validate()){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())); }
                    }
                ),
          // SizedBox(height: 10,),
          Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  
                                         //    Checkbox(value: value, onChanged: onChanged),
          Text('Already have an account?',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),),
          TextButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotP()));
                      }, 
          
                      child: Text('Login',
                      style:TextStyle(
                      
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 81, 0),
                      )
                        ,)),
              ],
            ),
              ],
          ),
        ),
      ),
    ),
    );
  }
}
