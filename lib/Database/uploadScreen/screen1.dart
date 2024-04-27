
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localrepo/Database/localdb.dart';
import 'package:localrepo/Database/uploadScreen/sc2.dart';
import 'package:localrepo/custom_widgets/button.dart';

class UploadDeviceScreen extends StatefulWidget {
  const UploadDeviceScreen({super.key});

  @override
  _UploadDeviceScreenState createState() => _UploadDeviceScreenState();
}

class _UploadDeviceScreenState extends State<UploadDeviceScreen> {
  FilePickerResult?result;
       File? _imageFile;
  String ? _filename;
  PlatformFile? pickedfile;
  bool isloading = false;
  File ? fileToDisplay;
  Uint8List? _image;
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
              appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 187, 98, 98),
      title: Center(child: Text('Rent or Sell',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),)),
      leading:  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new),) ,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.wallet),)
      ]),
      body: SingleChildScrollView(
        child: Stack(
          children: [
         
           Padding(
            
            padding: EdgeInsets.fromLTRB(20,30,20,30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

Container(
  height: 200,
width: 350,
decoration: BoxDecoration(
  color: Colors.grey[200],
  border: Border.all(color: Colors.black,width: 2),
  borderRadius: BorderRadius.circular(10),
   image: selectedImage != null ? DecorationImage(
      image: FileImage(selectedImage!),
      fit: BoxFit.cover,
    ) : null,
  ),

 child: Stack(
    children: [
      if (_imageFile != null)
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.file(
                _imageFile!,
              ),
            ),
          ),
        ),
      Positioned(
        top: 0,
        right: 0,
        child: IconButton(
          onPressed: _pickProfileImage,
          icon: Icon(Icons.photo, size: 30,color: Colors.white,),
        ),
      ),
    ],
  ),
),
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
                    CustomButton(text: 'Cancel', onPressed: (){
                      // Call the method to delete all data
           
                       _deviceNameController.clear();
            _descriptionController.clear();
            _rentPriceController.clear();
            _availbilityController.clear();
            _qualityController.clear();
           
            
            // Navigate to the HomeScreen or any other screen if needed
            //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
         
                    }),
                    
                      CustomButton(
            text: 'Upload',
            onPressed: () async { 
              double price = double.parse(_rentPriceController.text);
              int availability = int.parse(_availbilityController.text);
  //           Uint8List? imageData;
  // if (_imageFile != null) {
  //   imageData = await _imageFile!.readAsBytes();
  // }
    ///Uint8List imageData = await _imageFile!.readAsBytes();

            String result =        await LocalDatabase().addDataLocally(
          name: _deviceNameController.text,
          description: _descriptionController.text,
          price: price,
          availability: availability,
          //  image: imageData, 
              );
             
            if (result == 'added') {
        // Fetch the data
        List<Map<String, dynamic>>? fetchedData = await LocalDatabase().fetchDataLocally();
        
        // Navigate to the screen where you want to display the fetched data
        if (fetchedData != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => uploadScreen1(fetchedData: fetchedData),
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
          
                       })
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
     Future<void> _pickProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery, // Change to ImageSource.camera for camera access
    );

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }
}





