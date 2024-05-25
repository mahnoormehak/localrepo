import 'package:flutter/material.dart';

// class Transcript extends StatelessWidget {
//   final String renterName;
//   final String phoneNumber;
//   final String address;
//   final String deviceName;
//   final double rentAmount;
//   final int numberOfDays;
//   final DateTime startDate;
//   final DateTime endDate;
//   final double totalPrice;

//   const Transcript({
//     required this.renterName,
//     required this.phoneNumber,
//     required this.address,
//     required this.deviceName,
//     required this.rentAmount,
//     required this.numberOfDays,
//     required this.startDate,
//     required this.endDate,
//     required this.totalPrice,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Renter Name: $renterName',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text(
//               'Phone Number: $phoneNumber',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text(
//               'Address: $address',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text(
//               'Device: $deviceName',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text(
//               'Price per day: \$${rentAmount.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text(
//               'Number of days: $numberOfDays',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text(
//               'Start Date: ${startDate.toString().substring(0, 10)}',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text(
//               'End Date: ${endDate.toString().substring(0, 10)}',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               'Total Price: \$${totalPrice.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20.0),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Navigate back to previous screen
//                 },
//                 child: Text('Back'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
