// import 'package:flutter/material.dart';

// class gurantorDetails extends StatefulWidget {
//   const gurantorDetails({super.key});

//   @override
//   State<gurantorDetails> createState() => _gurantorDetailsState();
// }

// class _gurantorDetailsState extends State<gurantorDetails> {
//   final TextEditingController _guarantorNameController = TextEditingController();
//   final TextEditingController _phoneNumberController = TextEditingController();
//   final TextEditingController _idCardController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _digitalSignatureController = TextEditingController();
//   bool _areGuarantorDetailsFilled() {
//     return _guarantorNameController.text.isNotEmpty &&
//         _phoneNumberController.text.isNotEmpty &&
//         _idCardController.text.isNotEmpty &&
//         _addressController.text.isNotEmpty &&
//         _digitalSignatureController.text.isNotEmpty;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(title: Text('Gurantor Information' ),),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//                    TextField(
//                 controller: _guarantorNameController,
//                 decoration: InputDecoration(labelText: 'Guarantor Name'),
//               ),
//               TextField(
//                 controller: _phoneNumberController,
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//               ),
//               TextField(
//                 controller: _idCardController,
//                 decoration: InputDecoration(labelText: 'ID Card'),
//               ),
//               TextField(
//                 controller: _addressController,
//                 decoration: InputDecoration(labelText: 'Address'),
//               ),
//               TextField(
//                 controller: _digitalSignatureController,
//                 decoration: InputDecoration(labelText: 'Digital Signature'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }