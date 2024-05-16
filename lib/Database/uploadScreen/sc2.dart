

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:localrepo/Database/localdb.dart';
// import 'package:localrepo/rental_agreement/agreement_screen.dart';

// class uploadScreen1 extends StatefulWidget {
//     final List<Map<String, dynamic>>? fetchedData;
//   const uploadScreen1({Key? key, this.fetchedData}) : super(key: key);

//   @override
//   State<uploadScreen1> createState() => _uploadScreen1State();
// }

// class _uploadScreen1State extends State<uploadScreen1> {
//    final LocalDatabase _localDatabase = LocalDatabase();
//   List<Map<String, dynamic>>? _fetchedData;
//     int _selectedDays = 1; // Default number of days
//   @override
//   void initState() {
//     super.initState();
//   //  // Assign the fetched data from the widget's property to the local variable
//   //   _fetchedData = widget.fetchedData;
//   _fetchData();

//   }
//   Future<void> _fetchData() async {
//     try {
//     final data = (await LocalDatabase().fetchDataLocally()) ;
//     setState(() {
//     _fetchedData = data ; // Handle fetched data
//     });
//   } catch (e) {
//     print('Error fetching data: $e');
//     // Handle error
//   }
// }
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
//           // Pass device name and rental amount to RentalAgreementScreen
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


//   Widget build(BuildContext context) {
//      return Scaffold(
//       appBar: AppBar(
//         title: Text('upload device screen'),
//       ),
//       body: _fetchedData != null
      
//           ? ListView.builder(
//               itemCount: _fetchedData!.length,
//               itemBuilder: (context, index) {
//                 final item = _fetchedData![index];
//          // Add null check here
//  final Uint8List? imageData = item['image'] as Uint8List?;
//  // Print the image data
//                 print('Image Data: $imageData');
//                 return InkWell(
//            onTap: () {
//       //_generateInvoice(context, item);
//       _createInvoice(context, item);
// },

//     child: Container(
//         margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
//         padding: EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//          border:Border.all(color:Colors.purple ,width: 3,),
       
//           borderRadius: BorderRadius.circular(27.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
// if (imageData != null) // Display image if available
//                           Image.memory(
//                             imageData,
//                             height: 100,
//                             width: 100,
//                           ),
//              Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                               onPressed: () {
//                                 _showEditBottomSheet(context, item);
//                               },
//                               icon: Icon(Icons.edit),
//                             ),
//  IconButton(
//             onPressed: () async {
//               // Delete data from the database
//                await LocalDatabase().deleteDataLocally(item['id']);
// // Fetch updated data from the database
//     List<Map<String, dynamic>>? newData = await LocalDatabase().fetchDataLocally();
//                // Update the UI with the new data
//     setState(() {
//       _fetchedData = newData;
//     });
//             },
//             icon: Icon(Icons.delete),
//           ),
          
        
//               ],
//              ),
       
//             Text(
//             'Name: ${item['Name'] ?? ''}',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 17.0,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//                 'Description: ${item['description'] ?? ''}',
//               style: TextStyle(fontWeight: FontWeight.bold,
//                 fontSize: 17.0,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               'Price: ${item['price']?.toString() ?? ''}',
//               style: TextStyle(fontWeight: FontWeight.bold,
//                 fontSize: 17.0,),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               'Availability: ${item['availability']?.toString() ?? ''}',
//               style: TextStyle(fontWeight: FontWeight.bold,
//                 fontSize: 17.0,),
//             ),
//           ],
//         ),
//                 ),);
//     } 
//           )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//      // show bottom sheet
     
//   }
//   void _showEditBottomSheet(BuildContext context, Map<String, dynamic> item) {
//     TextEditingController nameController =
//         TextEditingController(text: item['Name']);
//     TextEditingController descriptionController =
//         TextEditingController(text: item['description']);
//     TextEditingController priceController =
//         TextEditingController(text: item['price']?.toString());
//     TextEditingController availabilityController =
//         TextEditingController(text: item['availability']?.toString());

//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext context) {
//           return Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: 'Name'),
//                 ),
//                 TextFormField(
//                   controller: descriptionController,
//                   decoration: InputDecoration(labelText: 'Description'),
//                 ),
//                 TextFormField(
//                   controller: priceController,
//                   decoration: InputDecoration(labelText: 'Price'),
//                 ),
//                 TextFormField(
//                   controller: availabilityController,
//                   decoration: InputDecoration(labelText: 'Availability'),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Update the item with new values
//                     // You can use the controllers' text values to get the updated values
//                     // For demonstration, I'm just printing here
//                     print('Updated Name: ${nameController.text}');
//                     print('Updated Description: ${descriptionController.text}');
//                     print('Updated Price: ${priceController.text}');
//                     print('Updated Availability: ${availabilityController.text}');

//                     // Update the data in the database
//                     // For example:
//                     await LocalDatabase().updateItemLocally(
//                       id: item['id'],
//                       name: nameController.text,
//                       description: descriptionController.text,
//                       price: double.tryParse(priceController.text) ?? 0,
//                       availability: int.tryParse(availabilityController.text) ?? 0,
//                     );

//                     // Refresh the UI to reflect the changes
//                     List<Map<String, dynamic>>? newData =
//                         await LocalDatabase().fetchDataLocally();
//                     setState(() {
//                       _fetchedData = newData;
//                     });

//                     Navigator.pop(context); // Close the bottom sheet
//                   },
//                   child: Text('Save',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.pink[600],
                    
//                   ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }

// }


