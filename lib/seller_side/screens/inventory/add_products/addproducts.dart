import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localrepo/seller_side/database/productsdb.dart';
import 'package:localrepo/seller_side/screens/inventory/all_products/all_products.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';
import 'package:localrepo/seller_side/widgets/button.dart';

class UploadDeviceScreen extends StatefulWidget {
  const UploadDeviceScreen({super.key});

  @override
  _UploadDeviceScreenState createState() => _UploadDeviceScreenState();
}

class _UploadDeviceScreenState extends State<UploadDeviceScreen> {
 // FilePickerResult?result;
       File? _imageFile;
  //String ? _filename;
 // PlatformFile? pickedfile;
  bool isloading = false;
  File ? fileToDisplay;
 // Uint8List? _image;
  File? selectedImage;
  final TextEditingController _deviceNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _rentPriceController = TextEditingController();
  final TextEditingController _availbilityController = TextEditingController();
    final TextEditingController _qualityController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen initializes
    _fetchData();
  } 
  void dispose() {
    _deviceNameController.dispose();
    _descriptionController.dispose();
    _rentPriceController.dispose();
    _availbilityController.dispose();
    _qualityController.dispose();
  
     String deviceName = _deviceNameController.text;
    String description = _descriptionController.text;
    String rentPrice = _rentPriceController.text;
    String availability= _availbilityController.text;
    String quality = _qualityController.text;


    super.dispose();
  }
   Future<void> _fetchData() async {
    try {
      final data = await LocalDatabase().fetchDataLocally();
      setState(() {
        // Handle fetched data
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error
    }
  }

   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
              appBar: CustomAppBar2(
        title: "Rent or Sell",
        appBarHeight: 90.0,
      //  paddingTop: 15.0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
         
           Padding(
            
            padding: EdgeInsets.fromLTRB(20,30,20,30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

//  GestureDetector(
//                 onTap: _pickImage, // Trigger image selection
//                 child: Container(
//                   width: 200,
//                   height: 200,
//                   color: Colors.grey[200],
//                   child: _imageFile != null
//                       ? Image.file(_imageFile!, fit: BoxFit.cover)
//                       : Icon(Icons.add_a_photo, size: 50),
//                 ),
//               ),
            SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(12.0),
               child: Column(
                 children: [
                   TextFormField(
                        controller: _deviceNameController,
                        decoration: InputDecoration(
                          labelText: 'Device Name',
                          prefixIcon: Icon(Icons.production_quantity_limits,
                          color: const Color.fromARGB(255, 134, 43, 10),size:28 ,),
                            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.purple ,width: 3),
          ),
          filled: true,
          fillColor: Colors.white,
                          
                        ),
                      ),
                
                  SizedBox(height: 15,) ,
                  TextFormField(
                    maxLines: 4,
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                       prefixIcon: Icon(Icons.description,
                       color: const Color.fromARGB(255, 134, 43, 10),size:28 ,
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
                     SizedBox(height: 15,) ,
                  TextFormField(
                    controller: _rentPriceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                       prefixIcon: Icon(Icons.price_change_sharp,color: const Color.fromARGB(255, 134, 43, 10),size:28 ,),
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
                     SizedBox(height: 15,) ,
                  TextFormField(
                    controller: _availbilityController,
                    decoration: InputDecoration(
                      labelText: 'Availability',
                       prefixIcon: Icon(Icons.event_available,color: const Color.fromARGB(255, 134, 43, 10),size:28 ,),
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
                    ],
               ),
             ), 
                
                   SizedBox(height: 20,) ,
                    
                     
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
            //         CustomButton2(text: 'Cancel', onPressed: (){
            //           // Call the method to delete all data
           
            //            _deviceNameController.clear();
            // _descriptionController.clear();
            // _rentPriceController.clear();
            // _availbilityController.clear();
            // _qualityController.clear();
           
            
            // // Navigate to the HomeScreen or any other screen if needed
            // //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
         
            //         }),
                    Expanded(
                      child: CustomButton(
                        text: 'Cancel',
                        color: AppColors.btn2color,
                        fontcolor: Colors.black45,
                        onPressed: (){
                        // Call the method to delete all data
                               
                         _deviceNameController.clear();
                                _descriptionController.clear();
                                _rentPriceController.clear();
                                _availbilityController.clear();
                                _qualityController.clear();
                               
                                
                                // Navigate to the HomeScreen or any other screen if needed
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                             
                      },
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    Expanded(
                      child: CustomButton(
                        text: 'Upload',
                        color: AppColors.btncolor,
                        fontcolor: Colors.white,
                        onPressed:() async { 
                                  double price = double.parse(_rentPriceController.text);
                                  int availability = int.parse(_availbilityController.text);
                             Uint8List imageData = Uint8List(0);
                      if (_imageFile != null) {
                        imageData = await _imageFile!.readAsBytes();
                      }
                        ///Uint8List imageData = await _imageFile!.readAsBytes();
                    
                                String result =        await LocalDatabase().addDataLocally(
                              name: _deviceNameController.text,
                              description: _descriptionController.text,
                              price: price,
                              availability: availability,
                              // imageData: imageData, 
                         
                              // image: imageData, 
                                  );
                                 
                                if (result == 'added') {
                            // Fetch the data
                            List<Map<String, dynamic>>? fetchedData = await LocalDatabase().fetchDataLocally();
                            
                            // Navigate to the screen where you want to display the fetched data
                            if (fetchedData != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CombinedScreen()
                                  //uploadScreen1(fetchedData: fetchedData),
                                ),
                              );
                            } else {
                              // Handle case where fetched data is null
                              print('Error: Fetched data is null');
                            }
                                } else {
                            // Handle case where data addition failed
                            print('Error: Data addition failed');
                                } 
                              
                         },),
                    ),
                    
  //                     CustomButton2(
  //           text: 'Upload',
  //           onPressed: () async { 
  //             double price = double.parse(_rentPriceController.text);
  //             int availability = int.parse(_availbilityController.text);
  //        Uint8List imageData = Uint8List(0);
  // if (_imageFile != null) {
  //   imageData = await _imageFile!.readAsBytes();
  // }
  //   ///Uint8List imageData = await _imageFile!.readAsBytes();

  //           String result =        await LocalDatabase().addDataLocally(
  //         name: _deviceNameController.text,
  //         description: _descriptionController.text,
  //         price: price,
  //         availability: availability,
  //         // imageData: imageData, 
     
  //         // image: imageData, 
  //             );
             
  //           if (result == 'added') {
  //       // Fetch the data
  //       List<Map<String, dynamic>>? fetchedData = await LocalDatabase().fetchDataLocally();
        
  //       // Navigate to the screen where you want to display the fetched data
  //       if (fetchedData != null) {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => CombinedScreen()
  //             //uploadScreen1(fetchedData: fetchedData),
  //           ),
  //         );
  //       } else {
  //         // Handle case where fetched data is null
  //         print('Error: Fetched data is null');
  //       }
  //           } else {
  //       // Handle case where data addition failed
  //       print('Error: Data addition failed');
  //           } 
          
  //                      })
                    ],
                  ),
          
              ],
              
            ),
            
          ),
          ]
        ),
      ),
    );
  }
     // Method to select an image from the device
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

// Method to upload device details along with the image to the database
  void _uploadToDevice() async {
    if (_imageFile == null) {
      // Show an error message or handle the case where no image is selected
      return;
    }

    // Read the image file as bytes
    final Uint8List imageData = await _imageFile!.readAsBytes();

    // Extract device details from text controllers
    String deviceName = _deviceNameController.text;
    String description = _descriptionController.text;
    double rentPrice = double.tryParse(_rentPriceController.text) ?? 0.0;
    int availability = int.tryParse(_availbilityController.text) ?? 0;

    // Store the device details along with the image data in the database
    String result = await LocalDatabase().addDataLocally(
      name: deviceName,
      description: description,
      price: rentPrice,
      availability: availability,
      // imageData: imageData,
    );

    if (result == 'added') {
      // Handle successful upload
      print('Device details uploaded successfully!');
    } else {
      // Handle upload failure
      print('Failed to upload device details.');
    }
  }
}