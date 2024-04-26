// ignore_for_file: library_private_types_in_public_api

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
  static const String rentalAgreement = '/rental_agreement';
  const RentalAgreementScreen({super.key});

  @override
  _RentalAgreementScreenState createState() => _RentalAgreementScreenState();
}

class _RentalAgreementScreenState extends State<RentalAgreementScreen> {
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
    'Other',
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
      });
    }
  }

  void _submitAgreement() {
    // Check if any field is empty
    if (renterNameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        addressController.text.isEmpty ||
        nationalityController.text.isEmpty ||
        idCardNumberController.text.isEmpty ||
        cityController.text.isEmpty ||
        deviceDetailsList.any((device) => device.rentAmount <= 0)) {
      _showErrorDialog('Please fill all the fields and specify device prices.');
    } else {
      // ignore: unused_local_variable
      RentalAgreement agreement = RentalAgreement(
        deviceName: selectedDevice,
        renterName: renterNameController.text,
        devices: deviceDetailsList,
        startDate: startDate,
        endDate: endDate,
      );

      // Simulate sending agreement data to a server
      // _sendAgreementToServer(agreement);
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20.0),
              const Text(
                'Select the device to rent: (Select only one device)',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              DropdownButton<String>(
                value: selectedDevice,
                items: deviceNames.map((name) {
                  return DropdownMenuItem<String>(
                    value: name,
                    child: Text(name),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedDevice = value ?? 'Camera';
                  });
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Enter renter details:',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
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
                'Specify the rental amount, responsibility, and payment methods for each device:',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              for (int i = 0; i < selectedNumberOfDevices; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Device ${i + 1}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Rental Amount for Device ${i + 1}'),
                      onChanged: (value) {
                        updateDeviceDetails(i + 1, double.parse(value),
                            deviceDetailsList[i].responsible);
                      },
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
                        const Text('I will be responsible for this device'),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Start Date: ${startDate.toString().substring(0, 10)}'),
                  ElevatedButton(
                    onPressed: () => _showDatePicker(context, true),
                    child: const Text('Select'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('End Date: ${endDate.toString().substring(0, 10)}'),
                  ElevatedButton(
                    onPressed: () => _showDatePicker(context, false),
                    child: const Text('Select'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitAgreement,
                child: const Text('Submit Agreement'),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RentalAgreementScreen(),
  ));
}
