
// import 'dart:io';
// import 'dart:math';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:localrepo/Database/localdb.dart';
// import 'package:localrepo/Database/uploadScreen/imgD.dart';
// import 'package:localrepo/rental_agreement/agreement_screen.dart';

// class CombinedScreen extends StatefulWidget {
//   @override
//   _CombinedScreenState createState() => _CombinedScreenState();
// }

// class _CombinedScreenState extends State<CombinedScreen> {
//   final dbHelper = DatabaseHelper.instance;
//   List<String> imagePaths = [];
//   List<Map<String, dynamic>>? _fetchedData;
//   List<String> selectedImages = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchDataAndImages();
//   }

//   Future<void> _fetchDataAndImages() async {
//     final List<Map<String, dynamic>> rows = await dbHelper.queryAllRows();
//     final List<Map<String, dynamic>>? data = await LocalDatabase().fetchDataLocally();
//     setState(() {
//       _fetchedData = data;
//       imagePaths.clear();
//       imagePaths.addAll(rows.map((row) => row[DatabaseHelper.columnImagePath] as String));
//     });
//   }

//   void _createInvoice(BuildContext context, Map<String, dynamic> item) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Rent or Buy?'),
//           content: Text('Do you want to rent or buy ${item['Name']}?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => RentalAgreementScreen(
//                       deviceName: item['Name'],
//                       rentAmount: item['price'] as double,
//                     ),
//                   ),
//                 );
//               },
//               child: Text('Rent'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showEditBottomSheet(BuildContext context, Map<String, dynamic> item) {
//     TextEditingController nameController = TextEditingController(text: item['Name']);
//     TextEditingController descriptionController = TextEditingController(text: item['description']);
//     TextEditingController priceController = TextEditingController(text: item['price']?.toString());
//     TextEditingController availabilityController = TextEditingController(text: item['availability']?.toString());

//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextFormField(
//                 controller: descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//               ),
//               TextFormField(
//                 controller: priceController,
//                 decoration: InputDecoration(labelText: 'Price'),
//               ),
//               TextFormField(
//                 controller: availabilityController,
//                 decoration: InputDecoration(labelText: 'Availability'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   await LocalDatabase().updateItemLocally(
//                     id: item['id'],
//                     name: nameController.text,
//                     description: descriptionController.text,
//                     price: double.tryParse(priceController.text) ?? 0,
//                     availability: int.tryParse(availabilityController.text) ?? 0,
//                   );

//                   List<Map<String, dynamic>>? newData = await LocalDatabase().fetchDataLocally();
//                   setState(() {
//                     _fetchedData = newData;
//                   });

//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   'Save',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.pink[600],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _clearSelectedImages() {
//     setState(() {
//       selectedImages.clear();
//     });
//   }

//   void _deleteAllData() async {
//     await dbHelper.deleteAllRows();
//     _fetchDataAndImages(); // Refresh the UI after deletion
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Combined Screen'),
        
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ElevatedButton(
//               onPressed: _deleteAllData,
//               child: Text('Delete All Data'),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: _buildImageAndDataWidgets(), // Render images and data
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   //////////////////////////////////////////////////////////////////////////
// // Widget _buildImageAndDataWidgets() {
// //   List<Widget> containers = [];
// //   int totalImages = imagePaths.length;

// //   // Iterate over the imagePaths list with a step of 4
// //   for (int i = 0; i < totalImages; i += 4) {
// //     List<String> batch = imagePaths.sublist(i, i + 4 < totalImages ? i + 4 : totalImages);
// //     List<Widget> imageWidgets = [];

// //     // Add image widgets for the current batch
// //     for (String path in batch) {
// //       imageWidgets.add(
// //         GestureDetector(
// //           onTap: () {
// //             setState(() {
// //               selectedImages.add(path);
// //             });
// //           },
// //           child: Container(
// //             width: 100,
// //             height: 100,
// //             margin: EdgeInsets.all(8.0),
// //             decoration: BoxDecoration(
// //               border: Border.all(color: selectedImages.contains(path) ? Colors.blue : Colors.black, width: 3.0),
// //               borderRadius: BorderRadius.circular(10.0),
// //               image: DecorationImage(
// //                 image: FileImage(File(path)),
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //           ),
// //         ),
// //       );
// //     }

// //     // Add data widget for the current batch if _fetchedData is not null
// //     if (_fetchedData != null && _fetchedData!.isNotEmpty) {
// //       final item = _fetchedData![i ~/ 4]; // Get the corresponding data item for this batch
// // Widget dataWidget = InkWell(
// //   onTap: () {
// //     _createInvoice(context, item);
// //   },
// //   child: Container(
// //     margin: EdgeInsets.only(top: 16.0),
// //     padding: EdgeInsets.all(16.0), // Increased padding
// //     decoration: BoxDecoration(
// //       border: Border.all(color: Colors.grey),
// //       borderRadius: BorderRadius.circular(10.0),
// //     ),
// //     width: double.infinity, // Set width to match the image container width
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.end,
// //           children: [
           
// //             Row(
// //               children: [
// //                 IconButton(
// //                   icon: Icon(Icons.edit),
// //                   onPressed: () {
// //                     _showEditBottomSheet(context, item);
// //                   },
// //                 ),
// //                 IconButton(
// //                           onPressed: () async {
// //                             await LocalDatabase().deleteDataLocally(item['id']);
// //                             List<Map<String, dynamic>>? newData = await LocalDatabase().fetchDataLocally();
// //                             setState(() {
// //                               _fetchedData = newData;
// //                             });
// //                           },
// //                           icon: Icon(Icons.delete),
// //                         ),
// //               ],
// //             ),
// //           ],
// //         ),
// //         SizedBox(height: 8.0),
// //          Text(
// //               'Name: ${item['Name'] ?? ''}',
// //               style: TextStyle(
// //                 fontWeight: FontWeight.bold,
// //                 fontSize: 17.0,
// //               ),
// //             ),
// //         Text(
// //           'Description: ${item['description'] ?? ''}',
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 17.0,
// //           ),
// //         ),
// //         SizedBox(height: 8.0),
// //         Text(
// //           'Price: ${item['price']?.toString() ?? ''}',
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 17.0,
// //           ),
// //         ),
// //         SizedBox(height: 8.0),
// //         Text(
// //           'Availability: ${item['availability']?.toString() ?? ''}',
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 17.0,
// //           ),
// //         ),
// //       ],
// //     ),
// //   ),
// // );
  
// //       // Create a container widget for the current batch of images and the data widget
// //       containers.add(
// //         Container(
// //           margin: EdgeInsets.all(16.0), // Increased margin
// //           padding: EdgeInsets.all(16.0), // Increased padding
// //           decoration: BoxDecoration(
// //             border: Border.all(color: Colors.black),
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Wrap(
// //                 spacing: 8.0,
// //                 runSpacing: 8.0,
// //                 children: imageWidgets,
// //               ),
// //               dataWidget,
// //             ],
// //           ),
// //         ),
// //       );
// //     }
// //   }

// //   return Column(
// //     crossAxisAlignment: CrossAxisAlignment.start,
// //     children: containers,
// //   );
// // }
// // }
// // Widget _buildImageAndDataWidgets() {
// //   List<Widget> containers = [];

// //   // Check if fetched data is not null and not empty
// //   if (_fetchedData != null && _fetchedData!.isNotEmpty) {
// //     // Iterate over the fetched data list
// //     for (Map<String, dynamic> item in _fetchedData!) {
// //       List<Widget> imageWidgets = [];

// //       // Add image widgets for the current item
// //       for (String path in imagePaths) {
// //         imageWidgets.add(
// //           GestureDetector(
// //             onTap: () {
// //               setState(() {
// //                 selectedImages.add(path);
// //               });
// //             },
// //             child: Container(
// //               width: 100,
// //               height: 100,
// //               margin: EdgeInsets.all(8.0),
// //               decoration: BoxDecoration(
// //                 border: Border.all(color: selectedImages.contains(path) ? Colors.blue : Colors.black, width: 3.0),
// //                 borderRadius: BorderRadius.circular(10.0),
// //                 image: DecorationImage(
// //                   image: FileImage(File(path)),
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       }

// //       // Create a data widget for the current item
// //       Widget dataWidget = InkWell(
// //         onTap: () {
// //           _createInvoice(context, item);
// //         },
// //         child: Container(
// //           margin: EdgeInsets.only(top: 16.0),
// //           padding: EdgeInsets.all(16.0),
// //           decoration: BoxDecoration(
// //             border: Border.all(color: Colors.grey),
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //           width: double.infinity,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.end,
// //                 children: [
// //                   IconButton(
// //                     icon: Icon(Icons.edit),
// //                     onPressed: () {
// //                       _showEditBottomSheet(context, item);
// //                     },
// //                   ),
// //                   IconButton(
// //                     onPressed: () async {
// //                       await LocalDatabase().deleteDataLocally(item['id']);
// //                       List<Map<String, dynamic>>? newData = await LocalDatabase().fetchDataLocally();
// //                       setState(() {
// //                         _fetchedData = newData;
// //                       });
// //                     },
// //                     icon: Icon(Icons.delete),
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(height: 8.0),
// //               Text(
// //                 'Name: ${item['Name'] ?? ''}',
// //                 style: TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   fontSize: 17.0,
// //                 ),
// //               ),
// //               Text(
// //                 'Description: ${item['description'] ?? ''}',
// //                 style: TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   fontSize: 17.0,
// //                 ),
// //               ),
// //               SizedBox(height: 8.0),
// //               Text(
// //                 'Price: ${item['price']?.toString() ?? ''}',
// //                 style: TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   fontSize: 17.0,
// //                 ),
// //               ),
// //               SizedBox(height: 8.0),
// //               Text(
// //                 'Availability: ${item['availability']?.toString() ?? ''}',
// //                 style: TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   fontSize: 17.0,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       );

// //       // Create a container widget for the current item
// //       containers.add(
// //         Container(
// //           margin: EdgeInsets.all(16.0),
// //           padding: EdgeInsets.all(16.0),
// //           decoration: BoxDecoration(
// //             border: Border.all(color: Colors.black),
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Wrap(
// //                 spacing: 8.0,
// //                 runSpacing: 8.0,
// //                 children: imageWidgets,
// //               ),
// //               dataWidget,
// //             ],
// //           ),
// //         ),
// //       );
// //     }
// //   }

// //   return Column(
// //     crossAxisAlignment: CrossAxisAlignment.start,
// //     children: containers,
// //   );
// // }
// // }
// /////////////////////////////////////////////////////////////////////////

// Widget _buildImageAndDataWidgets() {
//   List<Widget> containers = [];

//   // Check if fetched data is not null and not empty
//   if (_fetchedData != null && _fetchedData!.isNotEmpty) {
//     // Iterate over the fetched data list
//     for (Map<String, dynamic> item in _fetchedData!) {
//       List<Widget> imageWidgets = [];
      
//       // Get the images for the current item
//       List<String> itemImages = imagePaths.sublist(0, min(imagePaths.length, 4)); // Take the first four images
      
//       // Add image widgets for the current item
//       for (String path in itemImages) {
//         imageWidgets.add(
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedImages.add(path);
//               });
//             },
//             child: Container(
//               width: 100,
//               height: 100,
//               margin: EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 border: Border.all(color: selectedImages.contains(path) ? Colors.blue : Colors.black, width: 3.0),
//                 borderRadius: BorderRadius.circular(10.0),
//                 image: DecorationImage(
//                   image: FileImage(File(path)),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         );
//       }

//       // Create a data widget for the current item
//       Widget dataWidget = InkWell(
//         onTap: () {
//           _createInvoice(context, item);
//         },
//         child: Container(
//           margin: EdgeInsets.only(top: 16.0),
//           padding: EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.edit),
//                     onPressed: () {
//                       _showEditBottomSheet(context, item);
//                     },
//                   ),
//                   IconButton(
//                     onPressed: () async {
//                       await LocalDatabase().deleteDataLocally(item['id']);
//                       List<Map<String, dynamic>>? newData = await LocalDatabase().fetchDataLocally();
//                       setState(() {
//                         _fetchedData = newData;
//                       });
//                     },
//                     icon: Icon(Icons.delete),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 'Name: ${item['Name'] ?? ''}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17.0,
//                 ),
//               ),
//               Text(
//                 'Description: ${item['description'] ?? ''}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17.0,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 'Price: ${item['price']?.toString() ?? ''}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17.0,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 'Availability: ${item['availability']?.toString() ?? ''}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );

//       // Create a container widget for the current item
//       containers.add(
//         Container(
//           margin: EdgeInsets.all(16.0),
//           padding: EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.black),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Wrap(
//                 spacing: 8.0,
//                 runSpacing: 8.0,
//                 children: imageWidgets,
//               ),
//               dataWidget,
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: containers,
//   );
// }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:localrepo/Database/localdb.dart';
import 'package:localrepo/Database/uploadScreen/imgD.dart';
import 'package:localrepo/rental_agreement/agreement_screen.dart';

class CombinedScreen extends StatefulWidget {
  @override
  _CombinedScreenState createState() => _CombinedScreenState();
}

class _CombinedScreenState extends State<CombinedScreen> {
  final dbHelper = DatabaseHelper.instance;
  List<String> imagePaths = [];
  List<Map<String, dynamic>>? _fetchedData;
  List<String> selectedImages = [];

  @override
  void initState() {
    super.initState();
    _fetchDataAndImages();
  }

  Future<void> _fetchDataAndImages() async {
    final List<Map<String, dynamic>> rows = await dbHelper.queryAllRows();
    final List<Map<String, dynamic>>? data = await LocalDatabase().fetchDataLocally();
    setState(() {
      _fetchedData = data;
      imagePaths.clear();
      imagePaths.addAll(rows.map((row) => row[DatabaseHelper.columnImagePath] as String));
    });
  }

  void _createInvoice(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rent or Buy?'),
          content: Text('Do you want to rent or buy ${item['Name']}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RentalAgreementScreen(
                      deviceName: item['Name'],
                      rentAmount: item['price'] as double,
                    ),
                  ),
                );
              },
              child: Text('Rent'),
            ),
          ],
        );
      },
    );
  }

  void _showEditBottomSheet(BuildContext context, Map<String, dynamic> item) {
    TextEditingController nameController = TextEditingController(text: item['Name']);
    TextEditingController descriptionController = TextEditingController(text: item['description']);
    TextEditingController priceController = TextEditingController(text: item['price']?.toString());
    TextEditingController availabilityController = TextEditingController(text: item['availability']?.toString());

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              TextFormField(
                controller: availabilityController,
                decoration: InputDecoration(labelText: 'Availability'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await LocalDatabase().updateItemLocally(
                    id: item['id'],
                    name: nameController.text,
                    description: descriptionController.text,
                    price: double.tryParse(priceController.text) ?? 0,
                    availability: int.tryParse(availabilityController.text) ?? 0,
                  );

                  List<Map<String, dynamic>>? newData = await LocalDatabase().fetchDataLocally();
                  setState(() {
                    _fetchedData = newData;
                  });

                  Navigator.pop(context);
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[600],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _clearSelectedImages() {
    setState(() {
      selectedImages.clear();
    });
  }

  void _deleteAllData() async {
    await dbHelper.deleteAllRows();
    _fetchDataAndImages(); // Refresh the UI after deletion
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Combined Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _deleteAllData,
              child: Text('Delete All Data'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildImageAndDataWidgets(), // Render images and data
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageAndDataWidgets() {
    List<Widget> containers = [];

    // Check if fetched data is not null and not empty
    if (_fetchedData != null && _fetchedData!.isNotEmpty) {
      // Iterate over the fetched data list
      for (int i = 0; i < _fetchedData!.length; i++) {
        Map<String, dynamic> item = _fetchedData![i];
        List<Widget> imageWidgets = [];

        // Ensure images are correctly mapped to their respective items
        int startIndex = i * 4;
        int endIndex = startIndex + 4;
        List<String> itemImages = imagePaths.sublist(
            startIndex, endIndex > imagePaths.length ? imagePaths.length : endIndex);

        // Add image widgets for the current item
        for (String path in itemImages) {
          imageWidgets.add(
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedImages.add(path);
                });
              },
              child: Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: selectedImages.contains(path) ? Colors.blue : Colors.black,
                      width: 3.0),
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: FileImage(File(path)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        }

        // Create a data widget for the current item
        Widget dataWidget = InkWell(
          onTap: () {
            _createInvoice(context, item);
          },
          child: Container(
            margin: EdgeInsets.only(top: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _showEditBottomSheet(context, item);
                      },
                    ),
                    IconButton(
                      onPressed: () async {
                        await LocalDatabase().deleteDataLocally(item['id']);
                        List<Map<String, dynamic>>? newData =
                            await LocalDatabase().fetchDataLocally();
                        setState(() {
                          _fetchedData = newData;
                        });
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  'Name: ${item['Name'] ?? ''}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
                Text(
                  'Description: ${item['description'] ?? ''}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Price: ${item['price']?.toString() ?? ''}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Availability: ${item['availability']?.toString() ?? ''}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          ),
        );

        // Create a container widget for the current item
        containers.add(
          Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: imageWidgets,
                ),
                dataWidget,
              ],
            ),
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: containers,
    );
  }
}
