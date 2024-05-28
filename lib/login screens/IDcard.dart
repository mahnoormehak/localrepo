// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:localrepo/login%20screens/IdDb.dart';
// import 'dart:io';
// import 'database_helper1.dart';

// class IDVerificationScreen extends StatefulWidget {
//   @override
//   _IDVerificationScreenState createState() => _IDVerificationScreenState();
// }

// class _IDVerificationScreenState extends State<IDVerificationScreen> {
//   CameraController? controller;
//   List<CameraDescription>? cameras;
//   XFile? imageFile;
//   final DatabaseHelper1 dbHelper = DatabaseHelper1();

//   @override
//   void initState() {
//     super.initState();
//     initCamera();
//   }

//   Future<void> initCamera() async {
//     cameras = await availableCameras();
//     controller = CameraController(cameras![0], ResolutionPreset.high);
//     await controller!.initialize();
//     if (!mounted) return;
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   void captureImage() async {
//     final image = await controller!.takePicture();
//     setState(() {
//       imageFile = image;
//     });
//     saveToDatabase(image.path);
//   }

//   void pickImage() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     setState(() {
//       imageFile = image;
//     });
//     if (image != null) {
//       saveToDatabase(image.path);
//     }
//   }

//   void saveToDatabase(String imagePath) async {
//     // Dummy text extraction process
//     String extractedText = "Dummy extracted text from ID card";
//     await dbHelper.insertIDCard(imagePath, extractedText);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ID Verification'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: controller == null
//                 ? Center(child: CircularProgressIndicator())
//                 : CameraPreview(controller!),
//           ),
//           if (imageFile != null)
//             Image.file(File(imageFile!.path), height: 200, width: double.infinity, fit: BoxFit.cover),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: captureImage,
//                 child: Text('Capture'),
//               ),
//               ElevatedButton(
//                 onPressed: pickImage,
//                 child: Text('Pick from Gallery'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
