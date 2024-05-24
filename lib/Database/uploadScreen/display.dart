
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localrepo/Database/localdb.dart';
import 'package:localrepo/Database/uploadScreen/imgD.dart';
import 'package:localrepo/contract_page/installment.dart';
import 'package:localrepo/contract_page/partnership.dart';
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

 void alertDialog(BuildContext context, Map<String, dynamic> item) {
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
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  InstallmentScreen(
                    deviceName: item['Name'],
                    price: item['price'] as double,
                 
                  ),
                ),
              );
            },
            child: Text('Buy'),
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
  //  _fetchDataAndImages(); // Refresh the UI after deletion
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

  int totalImages = imagePaths.length;
  int totalDataItems = _fetchedData?.length ?? 0;
  int totalGroups = (totalImages / 4).ceil();

  for (int i = 0; i < totalGroups; i++) {
    List<Widget> imageWidgets = [];
    List<String> batch = imagePaths.sublist(i * 4, (i * 4 + 4) > totalImages ? totalImages : (i * 4 + 4));

    for (String path in batch) {
      try{imageWidgets.add(
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
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: FileImage(File(path)),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
} catch (e) {
    print('Error loading image: $e');
  }
}
    // Ensure there's a corresponding data item for this group
    if (i < totalDataItems) {
      Map<String, dynamic> item = _fetchedData![i];
      Widget dataWidget = InkWell(
        onTap: () {
          alertDialog(context, item);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
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
                      List<Map<String, dynamic>>? newData = await LocalDatabase().fetchDataLocally();
                      setState(() {
                        _fetchedData = newData;
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
              Text(
                'Name: ${item['Name'] ?? ''}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
              SizedBox(height: 8.0),
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
                spacing: 4.0,
                runSpacing: 4.0,
                children: imageWidgets,
              ),
              SizedBox(height: 10.0),
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

 









//   Widget _buildImageAndDataWidgets() {
//     List<Widget> widgets = [];
//     int totalImages = imagePaths.length;

//     for (int i = 0; i < totalImages; i += 4) {
//       List<String> batch = imagePaths.sublist(i, i + 4 < totalImages ? i + 4 : totalImages);
//       List<Widget> imageWidgets = batch.map((path) {
//         return GestureDetector(
//           onTap: () {
//             setState(() {
//               selectedImages.add(path);
//             });
//           },
//           child: Container(
//             width: 100,
//             height: 100,
//             margin: EdgeInsets.all(8.0),
//             decoration: BoxDecoration(
//               border: Border.all(color: selectedImages.contains(path) ? Colors.blue : Colors.black, width: 3.0),
//               borderRadius: BorderRadius.circular(10.0),
//               image: DecorationImage(
//                 image: FileImage(File(path)),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         );
//       }).toList();

//       List<Widget> dataWidgets = [];
//       if (_fetchedData != null && _fetchedData!.isNotEmpty) {
//         for (int j = 0; j < 4 && (i ~/ 4 * 4 + j) < _fetchedData!.length; j++) {
//           final item = _fetchedData![i ~/ 4 * 4 + j];
//           final Uint8List? imageData = item['image'] as Uint8List?;
//           dataWidgets.add(
//             InkWell(
//               onTap: () {
//                 alertDialog(context, item);
//               },
//               child: Container(
//                 margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
//                 padding: EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             _showEditBottomSheet(context, item);
//                           },
//                           icon: Icon(Icons.edit),
//                         ),
//                         IconButton(
//                           onPressed: () async {
//                             await LocalDatabase().deleteDataLocally(item['id']);
//                             List<Map<String, dynamic>>? newData = await LocalDatabase().fetchDataLocally();
//                             setState(() {
//                               _fetchedData = newData;
//                             });
//                           },
//                           icon: Icon(Icons.delete),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       'Name: ${item['Name'] ?? ''}',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17.0,
//                       ),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(
//                       'Description: ${item['description'] ?? ''}',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17.0,
//                       ),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(
//                       'Price: ${item['price']?.toString() ?? ''}',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17.0,
//                       ),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(
//                       'Availability: ${item['availability']?.toString() ?? ''}',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//       }

//       widgets.add(
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Wrap(
//               spacing: 8.0,
//               runSpacing: 8.0,
//               children: imageWidgets,
//             ),
//             SizedBox(height: 16.0), // Add some space between images and data
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: dataWidgets,
//             ),
//             SizedBox(height: 16.0),
//           ],
//         ),
//       );
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: widgets,
//     );
//   }
// }
