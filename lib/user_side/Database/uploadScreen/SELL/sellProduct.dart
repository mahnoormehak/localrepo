
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localrepo/user_side/Database/uploadScreen/SELL/LOcal.dart';
import 'package:localrepo/user_side/Database/uploadScreen/SELL/sell.dart';
import 'package:localrepo/user_side/custom_widgets/button.dart';
import 'package:localrepo/user_side/custom_widgets/textfield.dart';
import 'package:localrepo/user_side/models/Product.dart';
import 'package:lottie/lottie.dart';

class UploadDeviceScreen1 extends StatefulWidget {
  const UploadDeviceScreen1({super.key});

  @override
  _UploadDeviceScreenState1 createState() => _UploadDeviceScreenState1();
}

class _UploadDeviceScreenState1 extends State<UploadDeviceScreen1> {
  FilePickerResult? result;
  File? _imageFile;
  String? _filename;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;
  Uint8List? _image;
  File? selectedImage;
  String _priceType = 'rent'; // default price type
  final TextEditingController _deviceNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _availbilityController = TextEditingController();
  final TextEditingController _qualityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void dispose() {
    _deviceNameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _availbilityController.dispose();
    _qualityController.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    try {
      final data = await LocalDB2().fetchDataLocally1();
      setState(() {
        // Handle fetched data
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }


void _showSnackBarMessage(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 153, 21, 87),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 2.0),
      padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 2.0),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

  void _handleUpload() async {
    if (_deviceNameController.text.isEmpty) {
      _showSnackBarMessage('Please enter a device name');
      return;
    }
    if (_descriptionController.text.isEmpty) {
      _showSnackBarMessage('Please enter a description');
      return;
    }
    if (_priceController.text.isEmpty) {
      _showSnackBarMessage('Please enter a price');
      return;
    }
    if (_availbilityController.text.isEmpty) {
      _showSnackBarMessage('Please enter availability');
      return;
    }

    double price = double.parse(_priceController.text);
    int availability = int.parse(_availbilityController.text);
    Uint8List imageData = Uint8List(0);
    if (_imageFile != null) {
      imageData = await _imageFile!.readAsBytes();
    }

    String result = await LocalDB2().addDataLocally1(
      name: _deviceNameController.text,
      description: _descriptionController.text,
      price: price,
      availability: availability,
    );

    if (result == 'added') {
      List<Map<String, dynamic>>? fetchedData = await LocalDB2().fetchDataLocally1();
      if (fetchedData != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SellScreen(),
          ),
        );
      } else {
        print('Error: Fetched data is null');
      }
    } else {
      print('Error: Data addition failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
   
      appBar: AppBar(title: Text('sell screen'),),
      
      body: SingleChildScrollView(
        child: Stack(
          children: [
           
            Column(
              children: [
                 

                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Text(
                        'Set the Title, Description, Price, and Availability for your product.This will be displayed the part of your poducts offerings',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height:50 ,),
                      
                      Column(
                        children: [
                          CustomTextField(
                            controller: _deviceNameController,
                            text: 'Device Name',
                            icon: Icons.production_quantity_limits, validator: (value) {  },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLines: 9,
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              prefixIcon: Icon(
                                Icons.description,
                                color: const Color.fromARGB(255, 134, 43, 10),
                                size: 28,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(color: Colors.orange, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(color: Colors.purple, width: 3),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            controller: _priceController,
                            text: 'Price',
                            icon: Icons.price_change, validator: (value) {  },
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            controller: _availbilityController,
                            text: 'Availability',
                            icon: Icons.event_available, validator: (value) {  },
                          ),
                        ],
                      ),
                     SizedBox(height: 30),
                    
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     CustomButton(
                      //       text: 'Cancel',
                      //       onPressed: () {
                      //         _deviceNameController.clear();
                      //         _descriptionController.clear();
                      //         _priceController.clear();
                      //         _availbilityController.clear();
                      //         _qualityController.clear();
                      //       },
                      //     ),
                      //     CustomButton(
                      //       text: 'Upload',
                      //       onPressed: _handleUpload,
                      //     )
                      //   ],
                        
                        
                      // ),
                      
                    
  //                      ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Column(
                        children: [
                      
                         SizedBox(height: 50),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  text: 'Upload',
                                  onPressed: _handleUpload,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  // Method to upload device details along with the image to the database
  void _uploadToDevice() async {
    if (_imageFile == null) {
      return;
    }
    final Uint8List imageData = await _imageFile!.readAsBytes();
    String deviceName = _deviceNameController.text;
    String description = _descriptionController.text;
    double price = double.tryParse(_priceController.text) ?? 0.0;
    int availability = int.tryParse(_availbilityController.text) ?? 0;
    String result = await LocalDB2().addDataLocally1(
      name: deviceName,
      description: description,
      price: price,
      availability: availability,
    );
    if (result == 'added') {
      print('Device details uploaded successfully!');
    } else {
      print('Failed to upload device details.');
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}



