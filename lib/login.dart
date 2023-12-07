import 'package:flutter/material.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/custom_widgets/textfield.dart';

class LOGIN extends StatelessWidget {
   LOGIN({super.key});
final emailController = TextEditingController();
final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40,10,40,10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text('Welcome!!!',
                style:TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                    color: Colors.black,
                    )),
                    SizedBox(height: 20,),
                     Text('Log in to your account and shape your rental lifestyle! ',
                style:TextStyle(
                      fontSize: 17,
                      // fontWeight: FontWeight.w800,
                    color: Colors.black,
                    )),
                //        SizedBox(height: 20,),
                //      Text('Dive into the comfort of your rented heaven with just on click! ',
                // style:TextStyle(
                //       fontSize: 14,
                //       // fontWeight: FontWeight.w800,
                //     color: Colors.black,
                //     )),
                    SizedBox(height: 40,),
              //  Container(
              //   height: 300,
              //   width: 300,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(image: AssetImage('m1.jpg'),fit: BoxFit.cover),
              //   ),
              //  ), 
              //   its for background image
             
             Container(
              // child:
              //  Padding(
              //   padding: const EdgeInsets.fromLTRB(30,20,30,20),
                child: Column(
              children: [
                 CustomTextField(controller: emailController, Text: 'Enter email'),
                SizedBox(height: 20,),
                  CustomTextField(controller: passwordController, Text: 'Enter password'),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      
                                      TextButton(
                  onPressed: (){},
                  child: Text('Forget password?',
                      style: TextStyle(
                        
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 81, 0),
                      ),),
                ),
                    ],
                  )

               
              ],
                ),
              ),
            //),
              SizedBox(height: 30,),
              CustomButton(text: 'Login', onPressed: (){}),
               SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an account?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    TextButton(onPressed: (){}, 
                    child: Text('Sign up',
                    style:TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 81, 0),
                    )
                      ,)),
                    //  CustomButton(text: 'Sign Up', onPressed: (){})
                  ],
                ),
              )
          
             
          
              ],
            ),
          ),
        )
    );
  }
}
          