import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:typed_data';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/database/profile_auth.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/button.dart';

class editScreen extends StatefulWidget {
  const editScreen({Key? key}) : super(key: key);

  @override
  State<editScreen> createState() => _editScreenState();
}

class _editScreenState extends State<editScreen> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 
     final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         appBar: AppBar(
      backgroundColor: Colors.green,
      title: Center(child: Text('Profile',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,),)),
      // leading:  IconButton
      // (onPressed: (){
      //    Navigator.push(context, MaterialPageRoute(builder:
      //                      (context)=>HomeScreen(),
      //                      )
      //                      );
      // }, 
      
      // icon: Icon(Icons.arrow_back_ios_new),) ,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.wallet),)
      ]),
      body: Container(
          padding: EdgeInsets.only(left: 15,top: 20,right: 15),
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                         height: 130,
                         decoration: BoxDecoration(
                          border: Border.all(width: 4,color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(fit: BoxFit.cover,
                            image: NetworkImage('https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_1280.jpg'))
                         ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: Colors.white,
          ),
          color: Colors.blue,
        ),
        child: Icon(
          Icons.edit, color: Colors.white,
          ),
                      ),
                      ),
        
                    ],
                  ),
                ),
                SizedBox(height: 20,),
        
        
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
              TextFormField(
 
  controller: nameController,
  decoration: InputDecoration(
    labelText: 'Name',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),

),

                 
                    SizedBox(height: 10,) ,
                    TextFormField(

  controller: lastNameController,
  decoration: InputDecoration(
    labelText: 'Lastname',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
  
),

                    SizedBox(height: 10,) ,
                     TextFormField(
                   //    initialValue: _userData['email'],
                     controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'email',
                         
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      
                    ),
                    SizedBox(height: 10,) ,
                     TextFormField(
                     
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,) ,
                     TextFormField(
 
                     controller: phoneNumberController,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                         
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    
                    ),
                      
              ],
              ),
            ),
         
                SizedBox(height: 10,) ,
        
        
        
                    SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  
                  Expanded(
                    child: CustomButton(
                        text: 'cancel',
                        color: AppColors.btncolor,
                        fontcolor: Colors.white,
                        onPressed: () {
                           nameController.clear();
                              lastNameController.clear();
                              emailController.clear();
                              passwordController.clear();
                              countryController.clear();
                       
                     } 
                  
                    ),
                  ),
                    
                     Expanded(
                       child: CustomButton(
                        text: 'LogOut',
                        color: AppColors.btncolor,
                        fontcolor: Colors.white,
                        onPressed: () {
                        _updateUserData(); 
                          
                        } 
                     
                       ),
                     )
                  ],),   ],
            ),
          ),
        ),
      );
  }
    // Method to update user data in the database
  void _updateUserData() async {
    // Get the updated values from text field controllers
    String name = nameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String phone = phoneNumberController.text;

    // Prepare data to update
    Map<String, dynamic> userData = {
      'firstName': name,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
    };

    // Update user data in the database
    await DBHelper.insertAndFetchUser(userData);

    // Navigate back to profile screen
    Navigator.pop(context);
  }
}
