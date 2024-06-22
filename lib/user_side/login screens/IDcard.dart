
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:localrepo/user_side/login%20screens/IdDb.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IdCardVerificationScreen(),
    );
  }
}

class IdCardVerificationScreen extends StatefulWidget {
  @override
  _IdCardVerificationScreenState createState() => _IdCardVerificationScreenState();
}

class _IdCardVerificationScreenState extends State<IdCardVerificationScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // Save to database
      await _saveImageToDatabase(pickedFile.path);
    }
  }

  Future<void> _saveImageToDatabase(String imagePath) async {
    Map<String, dynamic> row = {
      'imagePath': imagePath,
    };
    await DatabaseHelp.instance.insertIdCard(row);
  }

  Future<List<Map<String, dynamic>>> _getImageList() async {
    return await DatabaseHelp.instance.getIdCardList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID Card Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image from Gallery'),
            ),
            ElevatedButton(
              onPressed: () async {
                List<Map<String, dynamic>> imageList = await _getImageList();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SingleChildScrollView(
                        child: Column(
                          children: imageList.map((image) {
                            return Image.file(File(image['imagePath']));
                          }).toList(),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Show Saved Images'),
            ),
          ],
        ),
      ),
    );
  }
}

