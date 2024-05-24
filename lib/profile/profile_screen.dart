
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localrepo/Database/uploadScreen/imgD.dart';
import 'package:localrepo/contract_page/contract_page.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:localrepo/profile/edit_profile.dart';
import 'package:localrepo/Database/authentication.dart';
import 'package:localrepo/login%20screens/login.dart';
import 'package:localrepo/onboarding_content/onboarding/screens/onboarding.dart';
import 'package:localrepo/routes.dart';
import 'package:localrepo/Database/database_helper.dart';  // Make sure to import your DatabaseHelper

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
    _loadImageFromDatabase(); // Load image from the database when the profile screen initializes
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
        title: const Text("Confirm Sign Out"),
        content: const Text("Are you sure you want to sign out?"),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Yes"),
            onPressed: () async {
              // Delete user data and navigate to HomeScreen
              await DBHelper.deleteUserData();
              // Reset the selected image variables
              setState(() {
                _selectedImageFile = null;
                _profileImagePath = null;
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const OnboardingScreen()),
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
      source: ImageSource.gallery, // Change to ImageSource.camera for camera access
    );

    if (image != null) {
      setState(() {
        _selectedImageFile = File(image.path);
        _profileImagePath = image.path; // Set the path for display
      });

      // Save the selected image path to the database
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const LOGIN()));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.wallet),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickProfileImage,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 90.0,
                        backgroundColor: Colors.grey,
                        child: _profileImagePath != null
                            ? ClipOval(
                                child: Image.file(
                                  File(_profileImagePath!),
                                  fit: BoxFit.cover,
                                  width: 190,
                                  height: 190,
                                ),
                              )
                            : Text(
                                // Display user's initials
                                '${userData['firstName'] != null ? userData['firstName'][0] : ''}${userData['lastName'] != null ? userData['lastName'][0] : ''}',
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: _pickProfileImage,
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: Color.fromARGB(255, 16, 110, 4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              // Display user's full name
              '${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}',
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              // Display user's email
              'Email: ${userData['email'] ?? ''}',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 10),
            Text(
              // Display user's phone number
              'Phone: ${userData['phone'] ?? ''}',
              style: const TextStyle(fontSize: 17),
            ),
            ListTile(
              trailing: const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const editScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.policy,
                color: Colors.black,
              ),
              title: const Text(
                'Policies',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                color: Colors.black,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const ContractPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.history,
                color: Colors.black,
              ),
              title: const Text(
                'Rent Items',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
              onTap: () {
                // Navigate to the upload device screen
                Navigator.pushNamed(context, AppRoutes.signUp);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.message_sharp,
                color: Colors.black,
              ),
              title: const Text(
                'Messages',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.sell,
                color: Colors.black,
              ),
              title: const Text(
                'Want to sell',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.history_edu_rounded,
                color: Colors.black,
              ),
              title: const Text(
                'Add to cart',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
              onTap: () {},
            ),
            Center(
              child: CustomButton(
                text: 'Signout',
                onPressed: () {
                  _confirmSignOut(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
