import 'package:flutter/material.dart';
import 'package:localrepo/contract_page/contract_page.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/homescreens/home_screen.dart';
import 'package:localrepo/profile/edit_profile.dart';
import 'package:localrepo/rental_agreement/agreement_screen.dart';

import 'dart:io';
import 'dart:typed_data';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:localrepo/Database/authentication.dart';
import 'package:localrepo/Database/localdb.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/custom_widgets/textfield.dart';
import 'package:localrepo/homescreens/agreement.dart';

import 'package:localrepo/login%20screens/login.dart';
import 'package:localrepo/login%20screens/signUP.dart';
import 'package:localrepo/onboarding_content/onboarding/screens/onboarding.dart';
import 'package:localrepo/routes.dart';
class Profile extends StatefulWidget {
 
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
    Map<String, dynamic> userData = {};
     // File? _imageFile;
      File? _selectedImageFile;

  @override

  void initState() {
    super.initState();
    fetchUserData(); // Fetch user data when the profile screen initializes
  }
   Future<void> fetchUserData() async {
     print('Fetching user data...');
    Map<String, dynamic> data = await DBHelper.fetchUserData();
     print('Fetched user data: $data');
    setState(() {
      userData = data;
    });
  }
  Future<void> _confirmSignOut(BuildContext context) async {
    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Sign Out"),
          content: Text("Are you sure you want to sign out?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () async {
                // Delete user data and navigate to HomeScreen
                await DBHelper.deleteUserData();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }
   Future<void> _pickProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery, // Change to ImageSource.camera for camera access
    );

    if (image != null) {
      setState(() {
        _selectedImageFile = File(image.path);
      });
    }
  }
   @override
  Widget build(BuildContext context) {
    
   return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue.shade100,
      title: Center(child: Text('Profile',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,),)),
      leading:  IconButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder:
                           (context)=>LOGIN(key: null,)));
      }, icon: Icon(Icons.arrow_back_ios_new),) ,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.wallet),)
      ]),
body:SingleChildScrollView(
  child: Column(
         children:[

      SizedBox(height: 20,),

GestureDetector(
  onTap: () {
    _pickProfileImage();
  },
  child: Stack(
    alignment: Alignment.center,
    children: [
      CircleAvatar(
        radius: 90.0,
        backgroundColor: Colors.grey,
        child: _selectedImageFile != null
            ? ClipOval(
                child: Image.file(
                  _selectedImageFile!,
                  fit: BoxFit.cover,
                  width: 190,
                  height: 190,
                ),
              )
            : Text(
                // Display user's initials
                '${userData['firstName'] != null ? userData['firstName'][0] : ''}${userData['lastName'] != null ? userData['lastName'][0] : ''}',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: IconButton(
          onPressed: () {
            _pickProfileImage();
          },
          icon: Icon(Icons.camera_alt,size: 30,color: Color.fromARGB(255, 16, 110, 4),),
        ),
      ),
    ],
  ),
),


            SizedBox(height: 10,),
                Text(
              // Display user's full name
              '${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 10),
            Text(
              // Display user's email
              'Email: ${userData['email'] ?? ''}',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 10),
            Text(
              // Display user's phone number
              'Phone: ${userData['phone'] ?? ''}',
              style: TextStyle(fontSize: 17),
            ),
 
   ListTile(
         trailing : Text('Edit Profile', style: TextStyle(fontSize: 20,fontWeight:FontWeight.normal,color: Colors.blue),),
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>editScreen()));
          },
        ),
           ListTile(
         leading: Icon(Icons.policy,color: Colors.black,),
          title: Text('Policies', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
          trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ContractPage()));
          },
        ),
        
          
           ListTile(
         leading: Icon(Icons.history,color: Colors.black,),
          title: Text('Rent Items', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
          trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
          onTap: (){
  //            Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) => UploadDeviceScreen(),
  //   ),
  // );
    GestureDetector(
                      onTap: () {
                        // Navigate to the login screen
                        Navigator.pushNamed(context, AppRoutes.signUp);
                      },);
          },
        ),
     
           ListTile(
         leading: Icon(Icons.message_sharp,color: Colors.black,),
          title: Text('Messages', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
          trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
          onTap: (){},
        ),
           
           ListTile(
         leading: Icon(Icons.sell,color: Colors.black,),
          title: Text('Want to sell', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
          trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
          onTap: (){
             
          },
        ),
          ListTile(
         leading: Icon(Icons.history_edu_rounded,color: Colors.black,),
          title: Text('Add to cart', style: TextStyle(fontSize: 17,fontWeight:FontWeight.normal,color: Colors.black),),
          trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
          onTap: (){},
        ),
     //  SizedBox(height:20 ,),
  Center(child: CustomButton(text: 'Signout', onPressed: (){
    _confirmSignOut(context); 
   } 

  ))
    ],
        ),
),
);
  }
}






