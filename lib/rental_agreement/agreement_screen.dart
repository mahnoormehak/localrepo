// import 'package:flutter/material.dart';

// class RentalAgreement {
//   final String deviceName;
//   final String renterName;
//   final List<DeviceDetails> devices;
//   final DateTime startDate;
//   final DateTime endDate;

//   RentalAgreement({
//     required this.deviceName,
//     required this.renterName,
//     required this.devices,
//     required this.startDate,
//     required this.endDate,
//   });
// }

// class DeviceDetails {
//   final int deviceNumber;
//   double rentAmount;
//   bool responsible;

//   DeviceDetails({
//     required this.deviceNumber,
//     required this.rentAmount,
//     required this.responsible,
//   });
// }

// class RentalAgreementScreen extends StatefulWidget {
//   final String deviceName;
//   final double rentAmount;

//   const RentalAgreementScreen({super.key, required this.deviceName, required this.rentAmount});

//   @override
//   _RentalAgreementScreenState createState() => _RentalAgreementScreenState();
// }

// class _RentalAgreementScreenState extends State<RentalAgreementScreen> {
//   final _formKey = GlobalKey<FormState>(); // Key for accessing the form's state
//   late TextEditingController renterNameController;
//   late TextEditingController phoneNumberController;
//   late TextEditingController addressController;
//   late TextEditingController nationalityController;
//   late TextEditingController idCardNumberController;
//   late TextEditingController cityController;
//   late DateTime startDate;
//   late DateTime endDate;
//   int selectedNumberOfDevices = 1;
//   List<DeviceDetails> deviceDetailsList = [];

//   List<String> deviceNames = [
//     'Camera',
//     'Tripod',
//     'Lenses',
//     'Other'
//   ]; // Add more as needed
//   String selectedDevice = 'Other'; // Set a default value

//   @override
//   void initState() {
//     super.initState();
//     startDate = DateTime.now();
//     endDate = DateTime.now().add(const Duration(days: 7));
//     initializeDeviceDetailsList();

//     renterNameController = TextEditingController();
//     phoneNumberController = TextEditingController();
//     addressController = TextEditingController();
//     nationalityController = TextEditingController();
//     idCardNumberController = TextEditingController();
//     cityController = TextEditingController();
//   }

//   void initializeDeviceDetailsList() {
//     deviceDetailsList = List<DeviceDetails>.generate(
//       selectedNumberOfDevices,
//       (index) => DeviceDetails(
//           deviceNumber: index + 1, rentAmount: 0, responsible: false),
//     );
//   }

//   @override
//   void dispose() {
//     renterNameController.dispose();
//     phoneNumberController.dispose();
//     addressController.dispose();
//     nationalityController.dispose();
//     idCardNumberController.dispose();
//     cityController.dispose();
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
//         // Update the total price based on the selected start and end dates
//         _updateTotalPrice();
//       });
//     }
//   }

//   void _updateTotalPrice() {
//     // Calculate the number of days between start and end dates
//     final int numberOfDays = endDate.difference(startDate).inDays;
//     // Update the total price for all devices
//     for (int i = 0; i < selectedNumberOfDevices; i++) {
//       deviceDetailsList[i].rentAmount = widget.rentAmount * numberOfDays;
//     }
//   }

//   void _generateInvoice(BuildContext context, Map<String, dynamic> item) {
//     // Extract renter details from the form
//     String renterName = renterNameController.text;
//     String idCardNumber = idCardNumberController.text;
//     String nationality = nationalityController.text;
//     String phoneNumber = phoneNumberController.text;
//     String address = addressController.text;
//     String city = cityController.text;

//     // Initialize the total price with the price for one day
//     double totalPrice = (item['price'] as double);
//     // Calculate the number of days between start and end dates
//     int numberOfDays = endDate.difference(startDate).inDays;

// // Calculate the total price based on the number of days
//     // ignore: unused_local_variable
// //  double totalPrice = widget.rentAmount * numberOfDays;

//     // Show bottom sheet with the invoice
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
//       ),
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return Container(
//               padding: const EdgeInsets.all(20.0),
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
//                 color: Color.fromARGB(255, 217, 230, 241),
//               ),
//               height: MediaQuery.of(context).size.height * 0.6,
//               width: MediaQuery.of(context).size.width * 3.8,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Invoice',
//                     style: TextStyle(
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20.0),
//                   Text(
//                     'Renter Name: $renterName',
//                     style: const TextStyle(
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     'Phone Number: $phoneNumber',
//                     style: const TextStyle(
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     'Address: $address',
//                     style: const TextStyle(
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     'Nationality: $nationality',
//                     style: const TextStyle(
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     'ID Card Number: $idCardNumber',
//                     style: const TextStyle(
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     'City: $city',
//                     style: const TextStyle(
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     'Device: ${widget.deviceName}',
//                     style: const TextStyle(
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     'Price per day: \$${widget.rentAmount}',
//                     style: const TextStyle(fontSize: 18.0),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     'Number of days: $numberOfDays',
//                     style: const TextStyle(fontSize: 18.0),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'Total Price: \$${totalPrice.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Checkout',
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           )),
//                     ],
//                   )
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   void _submitAgreement() {
//     // Check if any field is empty
//     if (renterNameController.text.isEmpty ||
//             phoneNumberController.text.isEmpty ||
//             addressController.text.isEmpty ||
//             nationalityController.text.isEmpty ||
//             idCardNumberController.text.isEmpty ||
//             cityController.text.isEmpty
//         // deviceDetailsList.any((device) => device.rentAmount <= 0)
//         ) {
//       _showErrorDialog('Please fill all the fields and specify device prices.');
//     } else {
//       _generateInvoice(context, {
//         'Name': renterNameController.text,
//         'description': selectedDevice,
//         'price': deviceDetailsList.fold<double>(
//             0, (total, device) => total + device.rentAmount),
//       });
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Error'),
//           content: Text(message),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void updateDeviceDetails(
//       int deviceNumber, double rentAmount, bool responsible) {
//     setState(() {
//       deviceDetailsList[deviceNumber - 1].rentAmount = rentAmount;
//       deviceDetailsList[deviceNumber - 1].responsible = responsible;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             'RENTAL AGREEMENT',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(40.0, 0, 40, 20),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 const SizedBox(height: 20.0),
//                 const Text(
//                   'Please Fill out all the details:',
//                   style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
//                 ),
//                 TextFormField(
//                   controller: renterNameController,
//                   decoration: const InputDecoration(labelText: 'Renter Name'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter renter name';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: phoneNumberController,
//                   keyboardType: TextInputType.phone,
//                   decoration: const InputDecoration(labelText: 'Phone Number'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter phone number';
//                     } else if (value.length != 11) {
//                       return 'Phone number must be 11 digits';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: addressController,
//                   decoration: const InputDecoration(labelText: 'Address'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter address';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: nationalityController,
//                   decoration: const InputDecoration(labelText: 'Nationality'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter nationality';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: idCardNumberController,
//                   decoration: const InputDecoration(labelText: 'ID Card Number'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter ID card number';
//                     } else if (value.length != 13) {
//                       return 'ID card number must be 13 digits';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: cityController,
//                   decoration: const InputDecoration(labelText: 'City'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter city';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20.0),
//                 const Text(
//                   'The device name and price per day:',
//                   style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 for (int i = 0; i < selectedNumberOfDevices; i++)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
//                         child: Container(
//                           height: 50,
//                           width: 60,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.black,
//                             ),
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           child: Center(
//                             child: Text(
//                               'Device: ${widget.deviceName}',
//                               style: const TextStyle(
//                                   fontSize: 18.0, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
//                         child: Container(
//                           height: 50,
//                           width: 60,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.black,
//                             ),
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           child: Center(
//                             child: Text(
//                               'Price per day: \$${widget.rentAmount}',
//                               style: const TextStyle(
//                                   fontSize: 18.0, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: deviceDetailsList[i].responsible,
//                             onChanged: (value) {
//                               updateDeviceDetails(
//                                   i + 1,
//                                   deviceDetailsList[i].rentAmount,
//                                   value ?? false);
//                             },
//                           ),
//                           const Text(
//                             'I will be responsible for this device',
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 5.0),
//                     ],
//                   ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                         'Start Date: ${startDate.toString().substring(0, 10)}'),
//                     TextButton(
//                         onPressed: () {
//                           _showDatePicker(context, true);
//                         },
//                         child: const Text(
//                           'Select',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ))
//                   ],
//                 ),
//                 const SizedBox(height: 5.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text('End Date: ${endDate.toString().substring(0, 10)}'),
//                     TextButton(
//                         onPressed: () {
//                           _showDatePicker(context, false);
//                         },
//                         child: const Text(
//                           'Select',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ))
//                   ],
//                 ),
//                 const SizedBox(height: 20.0),

//                 // CustomButton(text: 'Agree', onPressed: (){
//                 //      _submitAgreement();
//                 //     }),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(40),
//                       color: const Color.fromARGB(255, 255, 193, 8),
//                     ),
//                     child: TextButton(
//                         onPressed: () {
//                           _submitAgreement();
//                         },
//                         child: const Text(
//                           'Agree',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         )),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//     home: RentalAgreementScreen(
//       deviceName: '',
//       rentAmount: 0,
//     ),
//   ));
// }
import 'package:flutter/material.dart';

class RentalAgreement {
  final String deviceName;
  final String renterName;
  final List<DeviceDetails> devices;
  final DateTime startDate;
  final DateTime endDate;

  RentalAgreement({
    required this.deviceName,
    required this.renterName,
    required this.devices,
    required this.startDate,
    required this.endDate,
  });
}

class DeviceDetails {
  final int deviceNumber;
  double rentAmount;
  bool responsible;

  DeviceDetails({
    required this.deviceNumber,
    required this.rentAmount,
    required this.responsible,
  });
}

class RentalAgreementScreen extends StatefulWidget {
  final String deviceName;
  final double rentAmount;

  const RentalAgreementScreen({super.key, required this.deviceName, required this.rentAmount});

  @override
  _RentalAgreementScreenState createState() => _RentalAgreementScreenState();
}

class _RentalAgreementScreenState extends State<RentalAgreementScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for accessing the form's state
  late TextEditingController renterNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController addressController;
  late TextEditingController nationalityController;
  late TextEditingController idCardNumberController;
  late TextEditingController cityController;
  late DateTime startDate;
  late DateTime endDate;
  int selectedNumberOfDevices = 1;
  List<DeviceDetails> deviceDetailsList = [];

  List<String> deviceNames = [
    'Camera',
    'Tripod',
    'Lenses',
    'Other'
  ]; // Add more as needed
  String selectedDevice = 'Other'; // Set a default value

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now();
    endDate = DateTime.now().add(const Duration(days: 7));
    initializeDeviceDetailsList();

    renterNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    addressController = TextEditingController();
    nationalityController = TextEditingController();
    idCardNumberController = TextEditingController();
    cityController = TextEditingController();
  }

  void initializeDeviceDetailsList() {
    deviceDetailsList = List<DeviceDetails>.generate(
      selectedNumberOfDevices,
      (index) => DeviceDetails(
          deviceNumber: index + 1, rentAmount: 0, responsible: false),
    );
  }

  @override
  void dispose() {
    renterNameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    nationalityController.dispose();
    idCardNumberController.dispose();
    cityController.dispose();
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
        // Update the total price based on the selected start and end dates
        _updateTotalPrice();
      });
    }
  }

  void _updateTotalPrice() {
    // Calculate the number of days between start and end dates
    final int numberOfDays = endDate.difference(startDate).inDays;
    // Update the total price for all devices
    for (int i = 0; i < selectedNumberOfDevices; i++) {
      deviceDetailsList[i].rentAmount = widget.rentAmount * numberOfDays;
    }
  }

  void _generateInvoice(BuildContext context, Map<String, dynamic> item) {
    // Extract renter details from the form
    String renterName = renterNameController.text;
    String idCardNumber = idCardNumberController.text;
    String nationality = nationalityController.text;
    String phoneNumber = phoneNumberController.text;
    String address = addressController.text;
    String city = cityController.text;

    // Initialize the total price with the price for one day
    double totalPrice = (item['price'] as double);
    // Calculate the number of days between start and end dates
    int numberOfDays = endDate.difference(startDate).inDays;

    // Show bottom sheet with the invoice
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                color: Color.fromARGB(255, 217, 225, 233),
              ),
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width ,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Invoice',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  //  const SizedBox(height: 20.0),
                    Text(
                      'Renter Name: $renterName',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Phone Number: $phoneNumber',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Address: $address',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Nationality: $nationality',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'ID Card Number: $idCardNumber',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'City: $city',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Device: ${widget.deviceName}',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Price per day: \$${widget.rentAmount}',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Number of days: $numberOfDays',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Start Date: ${startDate.toString().substring(0, 10)}',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'End Date: ${endDate.toString().substring(0, 10)}',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Checkout',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _submitAgreement() {
    // Check if any field is empty
    if (renterNameController.text.isEmpty ||
            phoneNumberController.text.isEmpty ||
            addressController.text.isEmpty ||
            nationalityController.text.isEmpty ||
            idCardNumberController.text.isEmpty ||
            cityController.text.isEmpty
        // deviceDetailsList.any((device) => device.rentAmount <= 0)
        ) {
      _showErrorDialog('Please fill all the fields.');
    } else {
      _generateInvoice(context, {
        'Name': renterNameController.text,
        'description': selectedDevice,
        'price': deviceDetailsList.fold<double>(
            0, (total, device) => total + device.rentAmount),
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void updateDeviceDetails(
      int deviceNumber, double rentAmount, bool responsible) {
    setState(() {
      deviceDetailsList[deviceNumber - 1].rentAmount = rentAmount;
      deviceDetailsList[deviceNumber - 1].responsible = responsible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'RENTAL AGREEMENT',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 0, 40, 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20.0),
                const Text(
                  'Please Fill out all the details:',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                TextFormField(
                  controller: renterNameController,
                  decoration: const InputDecoration(labelText: 'Renter Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter renter name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter phone number';
                    } else if (value.length != 11) {
                      return 'Phone number must be 11 digits';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: nationalityController,
                  decoration: const InputDecoration(labelText: 'Nationality'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter nationality';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: idCardNumberController,
                  decoration: const InputDecoration(labelText: 'ID Card Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter ID card number';
                    } else if (value.length != 13) {
                      return 'ID card number must be 13 digits';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(labelText: 'City'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter city';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'The device name and price per day:',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < selectedNumberOfDevices; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                       
                          child: Center(
                            child: Text(
                              'Device: ${widget.deviceName}',
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                    
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                     
                          child: Center(
                            child: Text(
                              'Price per day: \$${widget.rentAmount}',
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                     //   ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: deviceDetailsList[i].responsible,
                            onChanged: (value) {
                              updateDeviceDetails(
                                  i + 1,
                                  deviceDetailsList[i].rentAmount,
                                  value ?? false);
                            },
                          ),
                          const Text(
                            'I will be responsible for this device',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        'Start Date: ${startDate.toString().substring(0, 10)}'),
                    TextButton(
                        onPressed: () {
                          _showDatePicker(context, true);
                        },
                        child: const Text(
                          'Select',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('End Date: ${endDate.toString().substring(0, 10)}'),
                    TextButton(
                        onPressed: () {
                          _showDatePicker(context, false);
                        },
                        child: const Text(
                          'Select',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
                const SizedBox(height: 20.0),

                // CustomButton(text: 'Agree', onPressed: (){
                //      _submitAgreement();
                //     }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromARGB(255, 255, 193, 8),
                    ),
                    child: TextButton(
                        onPressed: () {
                          _submitAgreement();
                        },
                        child: const Text(
                          'Agree',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RentalAgreementScreen(
      deviceName: '',
      rentAmount: 0,
    ),
  ));
}
