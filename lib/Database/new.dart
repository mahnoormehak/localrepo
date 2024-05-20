// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:localrepo/Database/localdb.dart';

// class ImageDisplayScreen extends StatefulWidget {
//   final int itemId;

//   ImageDisplayScreen({required this.itemId});

//   @override
//   _ImageDisplayScreenState createState() => _ImageDisplayScreenState();
// }

// class _ImageDisplayScreenState extends State<ImageDisplayScreen> {
//   Uint8List? _imageData;
//     final _nameController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   final _priceController = TextEditingController();
//   final _availabilityController = TextEditingController();


//   @override
//   void initState() {
//     super.initState();
//     _fetchImageFromDatabase();
//   }

//   Future<void> _fetchImageFromDatabase() async {
//     final database = LocalDatabase();
//     final imageData = await database.getImageFromDatabase(widget.itemId);
//     setState(() {
//       _imageData = imageData;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Display'),
//       ),
//       body: Center(
//         child: _imageData != null
//             ? Image.memory(_imageData!)
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }
