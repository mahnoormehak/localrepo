// import 'package:flutter/material.dart';
// import 'package:localrepo/login%20screens/IdDb.dart';
// import 'database_helper1.dart';
// import 'dart:io';

// class IDCardListScreen extends StatelessWidget {
//   final DatabaseHelper1 dbHelper = DatabaseHelper1();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stored ID Cards'),
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: dbHelper.getIDCards(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No ID cards found.'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final idCard = snapshot.data![index];
//                 return ListTile(
//                   leading: Image.file(File(idCard['image_path']), width: 50, height: 50, fit: BoxFit.cover),
//                   title: Text(idCard['extracted_text']),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
