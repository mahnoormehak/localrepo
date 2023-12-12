import 'package:flutter/material.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/custom_widgets/textfield.dart';

class forgotP extends StatelessWidget {
   forgotP({super.key});
  final newpassController = TextEditingController();
final confpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   title: Text('drawer'),
      // ),

      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40,30,40,10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Refresh your password now',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
               
              ),),
              SizedBox(height: 90),
              Container(
                child: Column(
                
                  children: [
                    CustomTextField(controller: newpassController, Text: 'New password'),
            SizedBox(height: 20,),
              CustomTextField(controller: confpassController,  Text: 'Confirm password',),
                 SizedBox(height: 80,),
                 CustomButton(text: 'Update', onPressed: (){}),
               
               
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