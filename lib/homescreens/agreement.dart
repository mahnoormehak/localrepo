// import 'package:flutter/material.dart';
// import 'package:localrepo/custom_widgets/button.dart';
// import 'package:localrepo/custom_widgets/textfield.dart';

// // Rental Agreement Model
// class RentalAgreement {
//   final String deviceName;
//   final String renterName;
//   final DateTime startDate;
//   final DateTime endDate;

//   RentalAgreement({
//     required this.deviceName,
//     required this.renterName,
//     required this.startDate,
//     required this.endDate,
//   });
// }

// // Rental Agreement Screen Widget
// class RentalAgreementScreen extends StatefulWidget {
//   @override
//   _RentalAgreementScreenState createState() => _RentalAgreementScreenState();
// }

// class _RentalAgreementScreenState extends State<RentalAgreementScreen> {
//   late TextEditingController deviceController;
//   late TextEditingController renterController;
//     late TextEditingController modelController;
//   late TextEditingController itemController;

//   late DateTime startDate;
//   late DateTime endDate;

//   @override
//   void initState() {
//     super.initState();
//     startDate = DateTime.now();
//     endDate = DateTime.now().add(Duration(days: 7)); // Default end date is 7 days from today
//     deviceController = TextEditingController();
//     renterController = TextEditingController();
//       modelController = TextEditingController();
//     itemController = TextEditingController();
   
//   }

//   @override
//   void dispose() {
//     deviceController.dispose();
//     renterController.dispose();
//        modelController.dispose();
//     itemController.dispose();
   
//     super.dispose();
//   }

//   Future<void> _showDatePicker(BuildContext context, bool isStartDate) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: isStartDate ? startDate : endDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );

//     if (picked != null && picked != (isStartDate ? startDate : endDate)) {
//       setState(() {
//         if (isStartDate) {
//           startDate = picked;
//         } else {
//           endDate = picked;
//         }
//       });
//     }
//   }

//   void _submitAgreement() {
//     // Validate and submit the rental agreement
//     if (deviceController.text.isNotEmpty  &&  renterController.text.isNotEmpty) {
//       RentalAgreement agreement = RentalAgreement(
//         deviceName: deviceController.text,
//         renterName: renterController.text,
//         startDate: startDate,
//         endDate: endDate,
//       );

//       // Here, you can add logic to save/send this agreement to your backend or database
//       // For simplicity, let's print the agreement details for now
//       print('Rental Agreement Details: ${agreement.toString()}');
//     } else {
//       // Handle empty fields
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Please fill in all fields.'),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Rental Agreement'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Text('Clearly describe the electronic device being rented, including its make, model, serial number, and any identifying information.'),
//             TextField(
//               controller: deviceController,
//               decoration: InputDecoration(labelText: 'Device Name'),
//             ),

//             SizedBox(height: 20.0),
         
//           SizedBox(height: 20.0),
//             TextField(
//               controller: renterController,
//               decoration: InputDecoration(labelText: 'Renter Name'),
//             ),
//             SizedBox(height: 20.0),
           
            
//               Text('Define the start and end dates of the rental period.'),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text('Start Date: ${startDate.toString().substring(0, 10)}'),
//                 ElevatedButton(
//                   onPressed: () => _showDatePicker(context, true),
//                   child: Text('Select'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text('End Date: ${endDate.toString().substring(0, 10)}'),
//                 ElevatedButton(
//                   onPressed: () => _showDatePicker(context, false),
//                   child: Text('Select'),
//                 ),
//               ],
//             ),
//             Text('Specify the rental amount, due dates, accepted payment methods, and any penalties for late payments.'),
//             SizedBox(height: 20.0),
//             Text('Clarify who is responsible for damages, theft, or loss of the device during the rental period. Consider including information about insurance coverage.'),


//             Text('Specify the jurisdiction and governing law in case of disputes.'),
//             ElevatedButton(
//               onPressed: _submitAgreement,
//               child: Text('Submit Agreement'),
//             ),
          
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: RentalAgreementScreen(),
//   ));
// }
import 'package:flutter/material.dart';

class RentalAgreement {
  final String deviceName;
  final String renterName;
  final DateTime startDate;
  final DateTime endDate;

  RentalAgreement({
    required this.deviceName,
    required this.renterName,
    required this.startDate,
    required this.endDate,
  });
}

class RentalAgreementScreen extends StatefulWidget {
  @override
  _RentalAgreementScreenState createState() => _RentalAgreementScreenState();
}

class _RentalAgreementScreenState extends State<RentalAgreementScreen> {
  late TextEditingController deviceController;
  late TextEditingController renterController;
  late DateTime startDate;
  late DateTime endDate;

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now();
    endDate = DateTime.now().add(Duration(days: 7));
    deviceController = TextEditingController();
    renterController = TextEditingController();
  }

  @override
  void dispose() {
    deviceController.dispose();
    renterController.dispose();
    super.dispose();
  }

  Future<void> _showDatePicker(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? startDate : endDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != (isStartDate ? startDate : endDate)) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  void _submitAgreement() {
    if (deviceController.text.isNotEmpty && renterController.text.isNotEmpty) {
      RentalAgreement agreement = RentalAgreement(
        deviceName: deviceController.text,
        renterName: renterController.text,
        startDate: startDate,
        endDate: endDate,
      );

      // Simulate sending agreement data to a server
      _sendAgreementToServer(agreement);
    } else {
      _showErrorDialog('Please fill in all fields.');
    }
  }

  void _sendAgreementToServer(RentalAgreement agreement) {
    // Send agreement data to the server (Simulated action)
    print('Sending Rental Agreement to the server: ${agreement.toString()}');
    // Here, you would handle server communication or database storage
    // This is a simulated action and does not actually send data anywhere
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Agreement'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text('RENTAL AGREEMENT',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
               SizedBox(height: 20.0),
                Text('Clearly describe the electronic device being rented, including its make, model, serial number, and any identifying information.',style: TextStyle(fontSize: 16, ),),
              TextField(
                controller: deviceController,
                decoration: InputDecoration(labelText: 'Device Name'),
              ),
              SizedBox(height: 20.0),
                Text('Clarify who is responsible for damages, theft, or loss of the device during the rental period. Consider including information about insurance coverage.',
                style: TextStyle(fontSize: 16, ),),
              TextField(
                controller: renterController,
                decoration: InputDecoration(labelText: 'Renter Name'),
              ),
              SizedBox(height: 20.0),
                Text('Define the start and end dates of the rental period.',style: TextStyle(fontSize: 16, ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Start Date: ${startDate.toString().substring(0, 10)}'),
                  ElevatedButton(
                    onPressed: () => _showDatePicker(context, true),
                    child: Text('Select'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('End Date: ${endDate.toString().substring(0, 10)}'),
                  ElevatedButton(
                    onPressed: () => _showDatePicker(context, false),
                    child: Text('Select'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitAgreement,
                child: Text('Submit Agreement'),
              ),
               
                        Text('Specify the rental amount, due dates, accepted payment methods, and any penalties for late payments.'),
            SizedBox(height: 20.0),
          


            Text('Specify the jurisdiction and governing law in case of disputes.'),
           
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RentalAgreementScreen(),
  ));
}

