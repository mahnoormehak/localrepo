import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localrepo/seller_side/screens/inventory/add_products/addproducts.dart';
import 'package:localrepo/seller_side/screens/inventory/add_products/imagepick.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';
import 'package:localrepo/seller_side/widgets/button.dart';
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
    appBar: CustomAppBar2(
        title: "Image Selector",
        appBarHeight: 90.0,
        //paddingTop: 15.0,
      ),
    body: Padding(
      padding: const EdgeInsets.all(30.0),
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
          SizedBox(height: 20.0),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
              itemCount: selectedImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _getImage(index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                    child: selectedImages[index] != null
                        ? Image.file(selectedImages[index]!)
                        : Icon(Icons.image,color: Color.fromARGB(113, 0, 26, 97),),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
      
          // Container(
          //   height: 45,
          //   width: 50,
          //   decoration: BoxDecoration(
          //     color: Color.fromARGB(255, 230, 194, 142),
          //     border: Border.all(color: Color.fromARGB(115, 185, 68, 68),width: 4),
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: TextButton(onPressed: ()async{
          //    for (File? image in selectedImages) {
          //         if (image != null) {
          //           await _saveToDatabase(image.path);
          //         }
          //       }
          //       _navigateToDisplayImagesScreen();
          //   }, child: Text('Next',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
          // ),
          CustomButton(
                      text: 'Next',
                      color: AppColors.btncolor,
                      fontcolor: Colors.white,
                      onPressed:()async{
             for (File? image in selectedImages) {
                  if (image != null) {
                    await _saveToDatabase(image.path);
                  }
                }
                _navigateToDisplayImagesScreen();
            },
                    ),
        ],
      ),
    ),
  );
}
}