import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/database/productsdb.dart';
import 'package:localrepo/seller_side/screens/inventory/add_products/imagepick.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';
import 'package:localrepo/seller_side/widgets/button.dart';

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
    try {
      final List<Map<String, dynamic>> rows = await dbHelper.queryAllRows();
      final List<Map<String, dynamic>>? data = await LocalDatabase().fetchDataLocally();
      setState(() {
        _fetchedData = data;
        imagePaths.clear();
        if (rows != null) {
          imagePaths.addAll(rows.map((row) => row[DatabaseHelper.columnImagePath] as String));
        }
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  // void _createInvoice(BuildContext context, Map<String, dynamic> item) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Rent or Buy?'),
  //         content: Text('Do you want to rent or buy ${item['Name']}?'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => RentalAgreementScreen(
  //                     deviceName: item['Name'],
  //                     rentAmount: item['price'] as double,
  //                   ),
  //                 ),
  //               );
  //             },
  //             child: Text('Rent'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
              CustomButton(
                      text: 'Edit',
                      color: AppColors.btncolor,
                      fontcolor: Colors.white,
                      onPressed:  () async {
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
                    ),
              // ElevatedButton(
              //   onPressed: () async {
              //     await LocalDatabase().updateItemLocally(
              //       id: item['id'],
              //       name: nameController.text,
              //       description: descriptionController.text,
              //       price: double.tryParse(priceController.text) ?? 0,
              //       availability: int.tryParse(availabilityController.text) ?? 0,
              //     );

              //     List<Map<String, dynamic>>? newData = await LocalDatabase().fetchDataLocally();
              //     setState(() {
              //       _fetchedData = newData;
              //     });

              //     Navigator.pop(context);
              //   },
              //   child: Text(
              //     'Save',
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.pink[600],
              //     ),
              //   ),
              // ),
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

  Widget _buildImageAndDataWidgets() {
    List<Widget> widgets = [];
    int totalImages = imagePaths.length;

    for (int i = 0; i < totalImages; i += 4) {
      List<String> batch = imagePaths.sublist(i, i + 4 < totalImages ? i + 4 : totalImages);
      List<Widget> imageWidgets = batch.map((path) {
        return GestureDetector(
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
              border: Border.all(color: selectedImages.contains(path) ? Colors.blue : Colors.black, width: 3.0),
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: FileImage(File(path)),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }).toList();

      List<Widget> dataWidgets = [];
      if (_fetchedData != null && _fetchedData!.isNotEmpty) {
        for (int j = 0; j < 4 && (i ~/ 4 * 4 + j) < _fetchedData!.length; j++) {
          final item = _fetchedData![i ~/ 4 * 4 + j];
          dataWidgets.add(
            InkWell(
              onTap: () {
              //  _createInvoice(context, item);
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
                          onPressed: () {
                            _showEditBottomSheet(context, item);
                          },
                          icon: Icon(Icons.edit),
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
            ),
          );
        }
      }

      widgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: imageWidgets,
            ),
            SizedBox(height: 16.0), // Add some space between images and data
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: dataWidgets,
            ),
            SizedBox(height: 16.0),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "All Products",
        appBarHeight: 90.0,
        paddingTop: 15.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            if (_fetchedData != null && _fetchedData!.isEmpty)
              Center(child: Text('No data available')),
            _buildImageAndDataWidgets(),
             //Spacer(),
            SizedBox(height: 20,),
            Center(
              child: CustomButton(
                      text: 'Delete All',
                      color: AppColors.btncolor,
                      fontcolor: Colors.white,
                      onPressed: _deleteAllData,
                    ),
            ) ,
          ],
        ),
      ),
    );
  }
}
