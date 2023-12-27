
import 'package:flutter/material.dart';
import 'package:localrepo/custom_widgets/button.dart';

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
        title: Center(child: Text('RENTAL AGREEMENT')),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20,20,20,20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text('RENTAL AGREEMENT',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
               SizedBox(height: 20.0),
                Text('Enter the electronic device being rented, including its make, model, serial number, and any identifying information.',style: TextStyle(fontSize: 16, ),),
              TextField(
                controller: deviceController,
                decoration: InputDecoration(labelText: 'Device Name'),
              ),
              SizedBox(height: 20.0),
                Text('Who is responsible for damages, theft, or loss of the device during the rental period?..',
                style: TextStyle(fontSize: 16, ),),
              TextField(
                controller: renterController,
                decoration: InputDecoration(labelText: 'Renter Name'),
              ),
              SizedBox(height: 20.0),
                          Text('Specify the jurisdiction and governing law in case of disputes.',   style: TextStyle(fontSize: 16, ),),
                           Text('Specify the rental amount, due dates, accepted payment methods, and any penalties for late payments.', style: TextStyle(fontSize: 16, ),),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            
                  CustomButton(text: ' Submit Agreement', onPressed:_submitAgreement )
                ],
              ),
             
                       
            SizedBox(height: 20.0),
          



           
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




// import 'package:flutter/material.dart';

// class RentalAgreement {
//   final String deviceName;
//   final String renterName;
//   final String modelNumber;
//   final double renterAmount;
//   final String paymentMethod;
//   final DateTime startDate;
//   final DateTime endDate;

//   RentalAgreement({
//     required this.deviceName,
//     required this.renterName,
//     required this.modelNumber,
//     required this.renterAmount,
//     required this.paymentMethod,
//     required this.startDate,
//     required this.endDate,
//   });
// }

// class RentalAgreementScreen extends StatefulWidget {
//   @override
//   _RentalAgreementScreenState createState() => _RentalAgreementScreenState();
// }

// class _RentalAgreementScreenState extends State<RentalAgreementScreen> {
//   late TextEditingController deviceController;
//   late TextEditingController renterController;
//   late TextEditingController modelController;
//   late TextEditingController rentAmountController;
//   late TextEditingController paymentMethodController;
//   late DateTime startDate;
//   late DateTime endDate;

//   @override
//   void initState() {
//     super.initState();
//     startDate = DateTime.now();
//     endDate = DateTime.now().add(Duration(days: 7));
//     deviceController = TextEditingController();
//     renterController = TextEditingController();
//     modelController = TextEditingController();
//     rentAmountController = TextEditingController();
//     paymentMethodController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     deviceController.dispose();
//     renterController.dispose();
//     modelController.dispose();
//     rentAmountController.dispose();
//     paymentMethodController.dispose();
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
//     if (deviceController.text.isNotEmpty &&
//         renterController.text.isNotEmpty &&
//         modelController.text.isNotEmpty &&
//         rentAmountController.text.isNotEmpty &&
//         paymentMethodController.text.isNotEmpty) {
//       RentalAgreement agreement = RentalAgreement(
//         deviceName: deviceController.text,
//         renterName: renterController.text,
//         modelNumber: modelController.text,
//         renterAmount: double.parse(rentAmountController.text),
//         paymentMethod: paymentMethodController.text,
//         startDate: startDate,
//         endDate: endDate,
//       );

//       // Simulate sending agreement data to a server
//       _sendAgreementToServer(agreement);
//     } else {
//       _showErrorDialog('Please fill in all fields.');
//     }
//   }

//   void _sendAgreementToServer(RentalAgreement agreement) {
//     // Send agreement data to the server (Simulated action)
//     print('Sending Rental Agreement to the server: ${agreement.toString()}');
//     // Here, you would handle server communication or database storage
//     // This is a simulated action and does not actually send data anywhere
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Error'),
//           content: Text(message),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('RENTAL AGREEMENT')),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Center(
//                 child: Text(
//                   'RENTAL AGREEMENT',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Text(
//                 'Enter the electronic device being rented, including its make, model, serial number, and any identifying information.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               TextField(
//                 controller: deviceController,
//                 decoration: InputDecoration(labelText: 'Device Name'),
//               ),
//               SizedBox(height: 20.0),
//               Text(
//                 'Who is responsible for damages, theft, or loss of the device during the rental period?',
//                 style: TextStyle(fontSize: 16),
//               ),
//               TextField(
//                 controller: renterController,
//                 decoration: InputDecoration(labelText: 'Renter Name'),
//               ),
//               SizedBox(height: 20.0),
//               Text(
//                 'Model Number',
//                 style: TextStyle(fontSize: 16),
//               ),
//               TextField(
//                 controller: modelController,
//                 decoration: InputDecoration(labelText: 'Model Number'),
//               ),
//               SizedBox(height: 20.0),
//               Text(
//                 'Renter Amount',
//                 style: TextStyle(fontSize: 16),
//               ),
//               TextField(
//                 controller: rentAmountController,
//                 decoration: InputDecoration(labelText: 'Renter Amount'),
//               ),
//               SizedBox(height: 20.0),
//               Text(
//                 'Payment Method',
//                 style: TextStyle(fontSize: 16),
//               ),
//               TextField(
//                 controller: paymentMethodController,
//                 decoration: InputDecoration(labelText: 'Payment Method'),
//               ),
//               SizedBox(height: 20.0),
//               Text(
//                 'Specify the jurisdiction and governing law in case of disputes.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               Text(
//                 'Specify the rental amount, due dates, accepted payment methods, and any penalties for late payments.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               Text(
//                 'Define the start and end dates of the rental period.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text('Start Date: ${startDate.toString().substring(0, 10)}'),
//                   ElevatedButton(
//                     onPressed: () => _showDatePicker(context, true),
//                     child: Text('Select'),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text('End Date: ${endDate.toString().substring(0, 10)}'),
//                   ElevatedButton(
//                     onPressed: () => _showDatePicker(context, false),
//                     child: Text('Select'),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: _submitAgreement,
//                 child: Text('Submit Agreement'),
//               ),
//               SizedBox(height: 20.0),
//             ],
//           ),
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
