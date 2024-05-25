
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/rental_agreement/invRent.dart';
//import 'package:localrepo/rental_agreement/transcript.dart';


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

 // Set a default value

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
  
  // If end date is not selected, default to 7 days
  if (numberOfDays <= 0) {
    deviceDetailsList.forEach((device) {
      device.rentAmount = widget.rentAmount * 7; // Calculate rent amount for 7 days
    });
  } else {
    // Update the total price for all devices
    deviceDetailsList.forEach((device) {
      device.rentAmount = widget.rentAmount * numberOfDays;
    });
  }
}


void _submitAgreement() {
  // Check if all fields are filled and validate guarantor details
  if (_DetailsFilled() && _validateDetails()) {
    // Calculate total price
    double totalPrice = deviceDetailsList.fold<double>(
      0, (total, device) => total + device.rentAmount);

    // Navigate to the InvoiceScreen with the necessary data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Transcript(
          renterName: renterNameController.text,
          phoneNumber: phoneNumberController.text,
          address: addressController.text,
          nationality: nationalityController.text,
          city: cityController.text,
          idCardNumber: idCardNumberController.text,
          deviceName: widget.deviceName,
          rentAmount: widget.rentAmount,
          numberOfDays: endDate.difference(startDate).inDays,
          startDate: startDate,
          endDate: endDate,
          totalPrice: totalPrice,
        ),
      ),
    );
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
  

  void _DetailsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Guarantor Details'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: renterNameController,
                  decoration: InputDecoration(labelText: 'Renter Name'),
                ),
                TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
                TextField(
                  controller: idCardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'ID Card Number'),
                ),
                TextField(
                  controller: nationalityController,
                  decoration: InputDecoration(labelText: 'Nationality'),
                ),
                 TextField(
                  controller: cityController,
                  decoration: InputDecoration(labelText: 'City'),
                ),
                 TextField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_DetailsFilled() && _validateDetails()) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        ' details saved!',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      backgroundColor: Color.fromARGB(255, 243, 146, 186),
                      action: SnackBarAction(
                        label: 'OK',
                        textColor: Colors.black,
                        onPressed: () {},
                      ),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Please correct the details as per the requirements',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      backgroundColor: Color.fromARGB(255, 243, 146, 186),
                      action: SnackBarAction(
                        label: 'OK',
                        textColor: Colors.black,
                        onPressed: () {},
                      ),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  bool _DetailsFilled() {
    return renterNameController.text.isNotEmpty &&
        idCardNumberController.text.isNotEmpty &&
        nationalityController.text.isNotEmpty &&
          phoneNumberController.text.isNotEmpty &&
            cityController.text.isNotEmpty &&
        addressController.text.isNotEmpty;
  }

  bool _validateDetails() {
    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    final addressRegExp = RegExp(r'^[a-zA-Z\s]+$');
    final nationRegExp = RegExp(r'^[a-zA-Z\s]+$');
    final cityRegExp = RegExp(r'^[a-zA-Z\s]+$');
    final phoneRegExp = RegExp(r'^\d{11}$');
    final idCardRegExp = RegExp(r'^\d{13}$');

    if (!nameRegExp.hasMatch(renterNameController.text)) {
      _showValidationError('Renter name must contain only letters and spaces.');
      return false;
    }
    if (!addressRegExp.hasMatch(addressController.text)) {
      _showValidationError('Address must contain only letters and spaces.');
      return false;
    }
      if (!cityRegExp.hasMatch(cityController.text)) {
      _showValidationError('City must contain only letters and spaces.');
      return false;
    }
      if (!nationRegExp.hasMatch(nationalityController.text)) {
      _showValidationError('Nationality must contain only letters and spaces.');
      return false;
    }
    if (!phoneRegExp.hasMatch(phoneNumberController.text)) {
      _showValidationError('Phone number must be exactly 11 digits.');
      return false;
    }
    if (!idCardRegExp.hasMatch(idCardNumberController.text)) {
      _showValidationError('ID card number must be exactly 13 digits.');
      return false;
    }
    return true;
  }

  void _showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
        backgroundColor: Color.fromARGB(255, 243, 146, 186),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.black,
          onPressed: () {},
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
                 
                ),
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  
                ),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                 
                ),
                TextFormField(
                  controller: nationalityController,
                  decoration: const InputDecoration(labelText: 'Nationality'),
                 
                ),
                TextFormField(
                  controller: idCardNumberController,
                  decoration: const InputDecoration(labelText: 'ID Card Number'),
                  
                ),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(labelText: 'City'),

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
              //  const SizedBox(height: 10.0),

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
/////////////////////////////this is invoice screen of retalagreement 
//import 'package:flutter/material.dart';


class Transcript extends StatelessWidget {
  final String renterName;
  final String phoneNumber;
  final String address;
  final String deviceName;
  final double rentAmount;
  final String nationality;
  final String city;
  final String idCardNumber;
  final int numberOfDays;
  final DateTime startDate;
  final DateTime endDate;
  final double totalPrice;

  const Transcript({
    required this.renterName,
    required this.phoneNumber,
    required this.address,
    required this.deviceName,
    required this.rentAmount,
    required this.nationality,
    required this.city,
    required this.idCardNumber,
    required this.numberOfDays,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
  });

  @override
  // Update the build method of the Transcript widget to include additional personal details
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Invoice'),
      backgroundColor: Colors.deepPurple,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Invoice',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                Divider(thickness: 2),
                SizedBox(height: 10.0),
                _buildSectionTitle('Renter Information'),
                _buildInfoRow('Renter Name:', renterName),
                _buildInfoRow('Phone Number:', phoneNumber),
                _buildInfoRow('Address:', address),
                _buildInfoRow('Nationality:', nationality as String), // Include nationality
                _buildInfoRow('ID Card Number:', idCardNumber as String), // Include ID card number
                _buildInfoRow('City:', city as String), // Include city
                SizedBox(height: 20.0),
                _buildSectionTitle('Device Information'),
                _buildInfoRow('Device Name:', deviceName),
                _buildInfoRow('Price per day:', '\$${rentAmount.toStringAsFixed(2)}'),
                _buildInfoRow('Number of days:', numberOfDays.toString()),
                _buildInfoRow('Start Date:', startDate.toString().substring(0, 10)),
                _buildInfoRow('End Date:', endDate.toString().substring(0, 10)),
                SizedBox(height: 20.0),
                Text(
                  'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to previous screen
                    },
                    child: Text('Back'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
// Modify the _buildSectionTitle method to include a title for personal details
Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
    ),
  );
}
// Modify the _buildInfoRow method to include additional personal details
Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}
}