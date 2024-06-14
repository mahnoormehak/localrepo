
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:localrepo/Database/imgD.dart';

// import 'package:localrepo/contract_page/contract_page.dart';
// import 'package:localrepo/custom_widgets/button.dart';
// import 'package:localrepo/profile/edit_profile.dart';
// import 'package:localrepo/Database/authentication.dart';
// import 'package:localrepo/login%20screens/login.dart';
// import 'package:localrepo/onboarding_content/onboarding/screens/onboarding.dart';
// import 'package:localrepo/routes.dart';
// import 'package:localrepo/Database/database_helper.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   Map<String, dynamic> userData = {};
//   final picker = ImagePicker();
//   File? _selectedImageFile;
//   final dbHelper = DatabaseHelper.instance;
//   String? _profileImagePath;

//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//     _loadImageFromDatabase();
//   }

//   Future<void> fetchUserData() async {
//     Map<String, dynamic> data = await DBHelper.fetchUserData();
//     setState(() {
//       userData = data;
//     });
//   }
// Future<void> _confirmSignOut(BuildContext context) async {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         title: const Text(
//           "Confirm Sign Out",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 207, 137, 32),
//           ),
//         ),
//         content: const Text(
//           "Are you sure you want to sign out?",
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.black54,
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text(
//               "Cancel",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.blue,
//               ),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: Color.fromARGB(255, 129, 61, 106),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text(
//               "Yes",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.white,
//               ),
//             ),
//             onPressed: () async {
//               await DBHelper.deleteUserData();
//               setState(() {
//                 _selectedImageFile = null;
//                 _profileImagePath = null;
//               });
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const OnboardingScreen()),
//               );
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

//   Future<void> _pickProfileImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(
//       source: ImageSource.gallery,
//     );

//     if (image != null) {
//       setState(() {
//         _selectedImageFile = File(image.path);
//         _profileImagePath = image.path;
//       });

//       await dbHelper.insert(image.path);
//     }
//   }

//   Future<void> _loadImageFromDatabase() async {
//     String? imagePath = await dbHelper.getLatestImagePath();
//     if (imagePath != null) {
//       setState(() {
//         _profileImagePath = imagePath;
//         _selectedImageFile = File(imagePath);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Profile',
//           style: TextStyle(
//             fontSize: 23,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//               context, MaterialPageRoute(builder: (context) => const LOGIN()));
//           },
//           icon: const Icon(Icons.arrow_back_ios_new),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.wallet),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: _pickProfileImage,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 70.0,
//                       backgroundColor: Colors.grey.shade200,
//                       child: _profileImagePath != null
//                           ? ClipOval(
//                               child: Image.file(
//                                 File(_profileImagePath!),
//                                 fit: BoxFit.cover,
//                                 width: 190,
//                                 height: 180,
//                               ),
//                             )
//                           : Text(
//                               '${userData['firstName'] != null ? userData['firstName'][0] : ''}${userData['lastName'] != null ? userData['lastName'][0] : ''}',
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                     ),
//                     Positioned(
//                       bottom: 5,
//                       right: 0,
//                       child: IconButton(
//                         onPressed: _pickProfileImage,
//                         icon: const Icon(
//                           Icons.camera_alt,
//                           size: 30,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 '${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}',
//                 style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 'Email: ${userData['email'] ?? ''}',
//                 style: const TextStyle(fontSize: 17),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 'Phone: ${userData['phone'] ?? ''}',
//                 style: const TextStyle(fontSize: 17),
//               ),
//               const Divider(height: 20, thickness: 2),
//               ListTile(
//                 trailing: const Text(
//                   'Edit Profile',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => const EditScreen())).then((value) {
//                     if (value != null && value is Map<String, dynamic>) {
//                       setState(() {
//                         userData = value;
//                       });
//                     }
//                   });
//                 },
//               ),
//               const Divider(height: 10, thickness: 2),
//               _buildListTile(
//                 icon: Icons.policy,
//                 title: 'Policies',
//                 onTap: () {
//                   Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => const ContractPage()));
//                 },
//               ),
//                _buildListTile(
//                 icon: Icons.reviews,
//                 title: 'Reviews',
//                 onTap: () {
//                   Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => const ContractPage()));
//                 },
//               ),
//               _buildListTile(
//                 icon: Icons.history,
//                 title: 'Rent Items',
//                 onTap: () {
//                   Navigator.pushNamed(context, AppRoutes.signUp);
//                 },
//               ),
//               _buildListTile(
//                 icon: Icons.feedback,
//                 title: 'Feedback',
//                 onTap: () {},
//               ),
//               _buildListTile(
//                 icon: Icons.sell,
//                 title: 'Become a Seller',
//                 onTap: () {},
//               ),
//               _buildListTile(
//                 icon: Icons.history_edu_rounded,
//                 title: 'Add to cart',
//                 onTap: () {},
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(30,0,30,0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: CustomButton(
//                         text: 'Sign out',
//                         onPressed: () {
//                           _confirmSignOut(context);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   ListTile _buildListTile({required IconData icon, required String title, required VoidCallback onTap}) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.black),
//       title: Text(
//         title,
//         style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal, color: Colors.black),
//       ),
//       trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
//       onTap: onTap,
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localrepo/Database/imgD.dart';
import 'package:localrepo/Database/uploadScreen/Rent/image.dart';
import 'package:localrepo/Database/uploadScreen/SELL/sellProduct.dart';
import 'package:localrepo/Database/uploadScreen/SELL/image.dart.dart';

import 'package:localrepo/contract_page/contract_page.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/login%20screens/IDcard.dart';
import 'package:localrepo/login%20screens/handleUser.dart';
import 'package:localrepo/main.dart';
import 'package:localrepo/profile/edit_profile.dart';
import 'package:localrepo/Database/authentication.dart';
import 'package:localrepo/login%20screens/login.dart';
import 'package:localrepo/onboarding_content/onboarding/screens/onboarding.dart';
import 'package:localrepo/routes.dart';
import 'package:localrepo/Database/database_helper.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic> userData = {};
  final picker = ImagePicker();
  File? _selectedImageFile;
  final dbHelper = DatabaseHelper.instance;
  String? _profileImagePath;

  @override
  void initState() {
    super.initState();
    fetchUserData();
    _loadImageFromDatabase();
  }

  Future<void> fetchUserData() async {
    Map<String, dynamic> data = await DBHelper.fetchUserData();
    setState(() {
      userData = data;
    });
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            "Confirm Sign Out",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 207, 137, 32),
            ),
          ),
          content: const Text(
            "Are you sure you want to sign out?",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 129, 61, 106),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Yes",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                await DBHelper.deleteUserData();
                setState(() {
                  _selectedImageFile = null;
                  _profileImagePath = null;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnboardingScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        _selectedImageFile = File(image.path);
        _profileImagePath = image.path;
      });

      await dbHelper.insert(image.path);
    }
  }

  Future<void> _loadImageFromDatabase() async {
    String? imagePath = await dbHelper.getLatestImagePath();
    if (imagePath != null) {
      setState(() {
        _profileImagePath = imagePath;
        _selectedImageFile = File(imagePath);
      });
    }
  }

  void _showSellerOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            "Become a Seller",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "Would you like to rent or sell items?",
            style: TextStyle(fontSize: 16),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Rent",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageSelectorPage()));
                // Navigate to rent items screen
               // Navigator.pushNamed(context, AppRoutes.rentItems);
              },
            ),
            TextButton(
              child: const Text(
                "Sell",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageSelectorPage1()));
                // Navigate to sell items screen
             //   Navigator.pushNamed(context, AppRoutes.sellItems);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LOGIN()));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickProfileImage,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.grey.shade200,
                      child: _profileImagePath != null
                          ? ClipOval(
                              child: Image.file(
                                File(_profileImagePath!),
                                fit: BoxFit.cover,
                                width: 190,
                                height: 180,
                              ),
                            )
                          : Text(
                              '${userData['firstName'] != null ? userData['firstName'][0] : ''}${userData['lastName'] != null ? userData['lastName'][0] : ''}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 0,
                      child: IconButton(
                        onPressed: _pickProfileImage,
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}',
                style: const TextStyle(
                    fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                'Email: ${userData['email'] ?? ''}',
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 5),
              Text(
                'Phone: ${userData['phone'] ?? ''}',
                style: const TextStyle(fontSize: 17),
              ),
              const Divider(height: 20, thickness: 2),
              ListTile(
                trailing: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditScreen()))
                      .then((value) {
                    if (value != null && value is Map<String, dynamic>) {
                      setState(() {
                        userData = value;
                      });
                    }
                  });
                },
              ),
              const Divider(height: 5, thickness: 2),
              _buildListTile(
                icon: Icons.policy,
                title: 'Policies',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyApp()));
                },
              ),
              _buildListTile(
                icon: Icons.reviews,
                title: 'Reviews',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  UserHandleScreen()));
                },
              ),
              _buildListTile(
                icon: Icons.history,
                title: 'Rent Items',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  IdCardVerificationScreen()));
                },
              ),
              _buildListTile(
                icon: Icons.feedback,
                title: 'Feedback',
                onTap: () {},
              ),
              _buildListTile(
                icon: Icons.sell,
                title: 'Become a Seller',
                onTap: _showSellerOptions,
              ),
              _buildListTile(
                icon: Icons.history_edu_rounded,
                title: 'Add to cart',
                onTap: () {},
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Sign out',
                        onPressed: () {
                          _confirmSignOut(context);
                        },
                      ),
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

  ListTile _buildListTile(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: Colors.black),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
      ),
      onTap: onTap,
    );
  }
}

