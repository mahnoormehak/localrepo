import 'package:flutter/material.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/custom_widgets/checkbox.dart';
import 'package:localrepo/custom_widgets/textfield.dart';

class signup extends StatelessWidget {
  // const signup({super.key});
     final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
        final TextEditingController phoneController = TextEditingController();
   final TextEditingController firstnamecontroller = TextEditingController();
 final TextEditingController lastnamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock),
 Text('Sign up', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
                
              ),
                ],
              ),
              
            
             SizedBox(height: 100,),
              Text('Sign up now to embark on a seamless renting experience! ', style: TextStyle(
                fontSize: 18,
                
                color: Colors.black,
              ),
                
              ),
              Container(
                
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(40,10,40,10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
  CustomTextField(controller:firstnamecontroller , Text: 'First name'),
                                            SizedBox(height: 15,),
                                              CustomTextField(controller:lastnamecontroller , Text: 'Last name'),
                                            SizedBox(height: 15,),
                                            CustomTextField(controller:emailController , Text: ' Email Address'),
                                            SizedBox(height: 15,),
                                            CustomTextField(controller:passwordController , Text: 'Password'),
                                            SizedBox(height: 15,),
                                            CustomTextField(controller:phoneController , Text: 'Phone number'),
                                            SizedBox(height: 15,),
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
                                            )
                                                ],
                                              ),
                              ),
              ),
       SizedBox(height: 15,),
      CustomButton(text: 'Signup', onPressed: (){}),
        SizedBox(height: 15,),
        Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                
                                       //    Checkbox(value: value, onChanged: onChanged),
Text('Already have an account?',
style: TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.normal,
),),
TextButton(onPressed: (){}, 
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
      );
    
  }
}