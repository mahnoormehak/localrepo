
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localrepo/user_side/Database/uploadScreen/SELL/sellD.dart';
import 'package:localrepo/user_side/Database/uploadScreen/SELL/sellProduct.dart';
import 'package:localrepo/user_side/custom_widgets/button.dart';
//import 'package:localrepo/Database/uploadScreen/display.dart';

class ImageSelectorPage1 extends StatefulWidget {
  @override
  _ImageSelectorPageState1 createState() => _ImageSelectorPageState1();
}

class _ImageSelectorPageState1 extends State<ImageSelectorPage1> {
  final picker = ImagePicker();
  List<File?> selectedImages = [];

  Future<void> _getImage() async {
    if (selectedImages.length >= 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can only upload up to 4 images.')),
      );
      return;
    }

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImages.add(File(pickedFile.path));
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _saveToDatabase(String imagePath) async {
    final dbHelper = SellDBHelper.instance;
    final id = await dbHelper.insert(imagePath);
    print('Inserted row id: $id');
  }

 void _navigateToDisplayImagesScreen() {
  if (selectedImages.length == 4) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UploadDeviceScreen1()),
    );
  } else {
  
ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Please select 4 images to continue.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 153, 21, 87),
      duration: Duration(seconds: 2),
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
}

  



  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text('Add images for Sell screen'),),
      body: Stack(
        children: [
          SingleChildScrollView(

         //   padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
               

                
                Text(
                  'Add images',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5,),
                const Text(
                  'Please select the images you want to upload. This will be displayed as part of your product offerings.',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: _getImage,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.blue.shade100,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.photo_library,
                            color: Colors.blue,
                            size: 50,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Upload Images',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Browse and upload up to 4 images only.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: selectedImages.asMap().entries.map((entry) {
                      int index = entry.key;
                      File? image = entry.value;

                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black87,
                                width: 2.0,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () => _removeImage(index),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)  ),
                                
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  
                ),
              
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(27.0),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Continue',
                  onPressed: () async {
                    for (File? image in selectedImages) {
                      if (image != null) {
                        await _saveToDatabase(image.path);
                      }
                    }
                    _navigateToDisplayImagesScreen();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
