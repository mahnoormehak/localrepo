import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localrepo/seller_side/database/sellerinfo_db.dart';
import 'package:localrepo/seller_side/providers/userid.dart';
import 'package:localrepo/seller_side/screens/login/login.dart';
import 'package:localrepo/seller_side/screens/profile/edit_address.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';
import 'package:localrepo/seller_side/widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
 
    final DatabaseHelper databaseHelper = Get.find<DatabaseHelper>(); // Access DatabaseHelper instance
    int userId = Get.find<UserIdController>().getUserId; // Access current user ID
final picker = ImagePicker();
  File? _selectedImageFile;
    String? _profileImagePath;

 
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
              backgroundColor: Color.fromARGB(255, 207, 137, 32),
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
            //  await DBHelper.deleteUserData();
              setState(() {
                _selectedImageFile = null;
                _profileImagePath = null;
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
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

    int userId = Get.find<UserIdController>().getUserId; // Get the current user ID
    await databaseHelper.insertProfileImage(userId, image.path); // Insert profile image with user ID
  }
}

Future<void> _loadImageFromDatabase() async {
  int userId = Get.find<UserIdController>().getUserId; // Get the current user ID
  String? imagePath = await databaseHelper.getLatestImagePath(userId); // Fetch the latest profile image path based on user ID

  if (imagePath != null) {
    setState(() {
      _profileImagePath = imagePath;
      _selectedImageFile = File(imagePath);
    });
  }
}
 @override
  void initState() {
    super.initState();
   // fetchUserData();
    _loadImageFromDatabase();
  }
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: 'Profile',
        appBarHeight: 100.0,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: databaseHelper.getUserData(userId), // Fetch user data based on userId
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          }

          var userData = snapshot.data;
          if (userData == null || userData.isEmpty) {
            return Center(child: Text('No user data found'));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                      onTap: _pickProfileImage,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 70.0,
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
                                     const SizedBox(height: 20),
                                Text(
                  userData['user']?['email'] ?? 'Not available',
                  style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                  userData['idCard']?['id_name'] ?? 'Not available',
                  style: const TextStyle(fontSize: 17),
                                ),
                                const SizedBox(height: 5),
                    ],
                  ),
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
                 // Navigator.push(
                   // context, MaterialPageRoute(builder: (context) => const editScreen())).then((value) {
                    // if (value != null && value is Map<String, dynamic>) {
                    //   setState(() {
                    //     userData = value;
                    //   });
                    // }
                  }),
    
                const Divider(height: 10, thickness: 2),
              _buildListTile(
                icon: Icons.policy,
                title: 'Policies',
                onTap: () {
                  // Navigator.push(
                  //   context, MaterialPageRoute(builder: (context) => const ContractPage()));
                },
              ),
               _buildListTile(
                icon: Icons.location_city,
                title: 'Address',
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => EditAddressScreen()));
                },
              ),
               _buildListTile(
                icon: Icons.balance,
                title: ' Bank Info ',
                onTap: () {
                  // Navigator.push(
                  //   context, MaterialPageRoute(builder: (context) => const ContractPage()));
                },
              ),
              _buildListTile(
                icon: Icons.info,
                title: 'ID Card Info',
                onTap: () {
                  // Navigator.push(
                  //   context, MaterialPageRoute(builder: (context) => const ContractPage()));
                },
              ),
               _buildListTile(
                icon: Icons.inventory,
                title: 'Add Products',
                onTap: () {
                  // Navigator.push(
                  //   context, MaterialPageRoute(builder: (context) => const ContractPage()));
                },
              ),
                // ListTile(
                //   title: Text('Business Address'),
                //   subtitle: Text(userData['address']?['business_address'] ?? 'Not available'),
                //   onTap: () {
                //     // Navigate to detail screen for business address
                //     // Example: Get.to(() => BusinessAddressDetailScreen(address: userData['address']['business_address']));
                //   },
                // ),
                // Divider(),
                // ListTile(
                //   title: Text('Warehouse Address'),
                //   subtitle: Text(userData['address']?['warehouse_address'] ?? 'Not available'),
                //   onTap: () {
                //     // Navigate to detail screen for warehouse address
                //     // Example: Get.to(() => WarehouseAddressDetailScreen(address: userData['address']['warehouse_address']));
                //   },
                // ),
                // Divider(),
                // ListTile(
                //   title: Text('Return Address'),
                //   subtitle: Text(userData['address']?['return_address'] ?? 'Not available'),
                //   onTap: () {
                //     // Navigate to detail screen for return address
                //     // Example: Get.to(() => ReturnAddressDetailScreen(address: userData['address']['return_address']));
                //   },
                // ),
                // Divider(),
                // ListTile(
                //   title: Text('ID Number'),
                //   subtitle: Text(userData['idCard']?['id_number'] ?? 'Not available'),
                // ),
                // Divider(),
                // ListTile(
                //   title: Text('Bank Name'),
                //   subtitle: Text(userData['bankInfo']?['bank_name'] ?? 'Not available'),
                //   onTap: () {
                //     // Navigate to detail screen for bank information
                //     // Example: Get.to(() => BankInfoDetailScreen(bankInfo: userData['bankInfo']));
                //   },
                // ),
                // Divider(),
                // ListTile(
                //   title: Text('Account Holder Name'),
                //   subtitle: Text(userData['bankInfo']?['account_holder_name'] ?? 'Not available'),
                // ),
                // Divider(),
                // ListTile(
                //   title: Text('Account Number'),
                //   subtitle: Text(userData['bankInfo']?['account_number'] ?? 'Not available'),
                // ),
                // Divider(),
                // ListTile(
                //   title: Text('Branch Code'),
                //   subtitle: Text(userData['bankInfo']?['branch_code'] ?? 'Not available'),
                // ),
                // Divider(),
                // ListTile(
                //   title: Text('IBAN'),
                //   subtitle: Text(userData['bankInfo']?['iban'] ?? 'Not available'),
                // ),
                    const SizedBox(height: 20),
              Center(
                child: CustomButton(
                  text: 'Sign out',
                  onPressed: () {
                    _confirmSignOut(context);
                  }, color: AppColors.btncolor, fontcolor: Colors.white,
                ),
              ),
              ],
            ),
          );
        },
      ),
    );
  }

  ListTile _buildListTile({required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal, color: Colors.black),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
      onTap: onTap,
    );
  }
}

