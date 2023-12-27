import 'package:flutter/material.dart';
import 'package:localrepo/custom_widgets/button.dart';
// import 'package:localrepo/custom_widgets/checkbox.dart';
import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:localrepo/login%20screens/login.dart';

class signup extends StatelessWidget {
  // const signup({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock),
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'Sign up now to embark on a seamless renting experience! ',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade600,
              ),
                
              ),
              SizedBox(height: 20,),
              Container(
                
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(40,10,40,10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  CustomTextField(controller: firstnamecontroller, text: 'First Name', icon: Icons.person),
                                                     CustomTextField(controller: lastnamecontroller, text: 'Last Name', icon: Icons.person),
                                                        CustomTextField(controller: emailController, text: 'Emai Address', icon: Icons.email),
                                                           CustomTextField(controller: passwordController, text: 'Password', icon: Icons.password),
                                                              CustomTextField(controller: phoneController, text: 'Phone number', icon: Icons.phone),
  //                                           SizedBox(height: 15,),
  //                                             CustomTextField(controller:lastnamecontroller , Text: 'Last name'),
  //                                           SizedBox(height: 15,),
  //                                           CustomTextField(controller:emailController , Text: 'Email Address'),
  //                                           SizedBox(height: 15,),
  //                                           CustomTextField(controller:passwordController , Text: 'Password'),
  //                                           SizedBox(height: 15,),
  //                                           CustomTextField(controller:phoneController , Text: 'Phone number'),
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
                      decoration: TextDecoration.underline,
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
