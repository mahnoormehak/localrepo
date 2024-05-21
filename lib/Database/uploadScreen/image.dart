import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localrepo/Database/uploadScreen/display.dart';
import 'package:localrepo/Database/uploadScreen/imgD.dart';
//import 'package:localrepo/Database/uploadScreen/sc2.dart';
import 'package:localrepo/Database/uploadScreen/screen1.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:lottie/lottie.dart';

class ImageSelectorPage extends StatefulWidget {
  @override
  _ImageSelectorPageState createState() => _ImageSelectorPageState();
}

class _ImageSelectorPageState extends State<ImageSelectorPage> {
  final picker = ImagePicker();
  List<File?> selectedImages = [null, null, null, null];
  final dbHelper = DatabaseHelper.instance;

  Future<void> _getImage(int index) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        selectedImages[index] = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _saveToDatabase(String imagePath) async {
    final id = await dbHelper.insert(imagePath);
    print('Inserted row id: $id');
  }

  void _navigateToDisplayImagesScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UploadDeviceScreen()),
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Image Selector'),
    ),
    body: Padding(
      padding: const EdgeInsets.fromLTRB(30,0,30,30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Please select the images you want to upload:',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
                  child: Lottie.asset(
                    'assets/lotties/pic1.json', // Adjust the path to match your animation file
                    height: 200, // Adjust the height as needed
                    width: 350,
                  ),
                ),

         // SizedBox(height: 20.0),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: selectedImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _getImage(index),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                     //   borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                      child: selectedImages[index] != null
                          ? Image.file(
                              selectedImages[index]!,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.image,color: Color.fromARGB(113, 0, 26, 97),),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          CustomButton(text: 'Next', onPressed: ()async{
            for (File? image in selectedImages) {
                  if (image != null) {
                    await _saveToDatabase(image.path);
                  }
                }
                _navigateToDisplayImagesScreen();
          }),
    
         
         
            
           ] )
          )
        
      );
}
}