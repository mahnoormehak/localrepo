
import 'package:flutter/material.dart';
import 'package:localrepo/contract_page/invoiceINS.dart';
//import 'invoice_screen.dart'; // Import the invoice screen

class InstallmentScreen extends StatefulWidget {
  final String deviceName;
  final double price;

  InstallmentScreen({required this.deviceName, required this.price});

  @override
  _InstallmentScreenState createState() => _InstallmentScreenState();
}

class _InstallmentScreenState extends State<InstallmentScreen> {
  List<Map<String, dynamic>> installmentPlans = [
    {'months': 1, 'rate': 0.0, 'selected': false},
    {'months': 2, 'rate': 0.0, 'selected': false},
    {'months': 3, 'rate': 0.0, 'selected': false},
    {'months': 4, 'rate': 0.0, 'selected': false},
    {'months': 5, 'rate': 0.0, 'selected': false},
  ];

  Map<String, dynamic>? selectedPlan;
  final TextEditingController _guarantorNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _idCardController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void _selectPlan(int index) {
    setState(() {
      for (var plan in installmentPlans) {
        plan['selected'] = false;
      }
      installmentPlans[index]['selected'] = true;
      selectedPlan = installmentPlans[index];
    });
  }

  void _showPlanDetails(BuildContext context) {
    if (selectedPlan != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InvoiceScreen(
            deviceName: widget.deviceName,
            price: widget.price,
            selectedPlan: selectedPlan!,
            guarantorName: _guarantorNameController.text,
            phoneNumber: _phoneNumberController.text,
            idCardNumber: _idCardController.text,
            address: _addressController.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please select an installment plan.',
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
  }

  void _showTermsAndConditions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Terms and Conditions'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1. Monthly payments are due on the 1st of each month.'),
                SizedBox(height: 10),
                Text('2. A late payment penalty of \$500.00 will be applied if the payment is not received by the due date.'),
                SizedBox(height: 10),
                Text('3. A prepayment penalty of \$500.00 will be applied if the loan is paid off early.'),
                SizedBox(height: 10),
                Text('4. The financed item (${widget.deviceName}) will serve as collateral until the loan is fully paid.'),
                SizedBox(height: 10),
                Text('5. Renegotiation is allowed after 3 months of timely payments.'),
                SizedBox(height: 10),
                Text('6. Due dates for each installment are as follows:'),
                for (int i = 1; i <= installmentPlans.length; i++) Text('   - Month $i: Due date $i'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showGuarantorDetailsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Guarantor Details'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _guarantorNameController,
                  decoration: InputDecoration(labelText: 'Guarantor Name'),
                ),
                TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
                TextField(
                  controller: _idCardController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'ID Card Number'),
                ),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_areGuarantorDetailsFilled() && _validateGuarantorDetails()) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Guarantor details saved!',
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

  bool _areGuarantorDetailsFilled() {
    return _guarantorNameController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _idCardController.text.isNotEmpty &&
        _addressController.text.isNotEmpty;
  }

  bool _validateGuarantorDetails() {
    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    final addressRegExp = RegExp(r'^[a-zA-Z\s]+$');
    final phoneRegExp = RegExp(r'^\d{11}$');
    final idCardRegExp = RegExp(r'^\d{13}$');

    if (!nameRegExp.hasMatch(_guarantorNameController.text)) {
      _showValidationError('Guarantor name must contain only letters and spaces.');
      return false;
    }
    if (!addressRegExp.hasMatch(_addressController.text)) {
      _showValidationError('Address must contain only letters and spaces.');
      return false;
    }
    if (!phoneRegExp.hasMatch(_phoneNumberController.text)) {
      _showValidationError('Phone number must be exactly 11 digits.');
      return false;
    }
    if (!idCardRegExp.hasMatch(_idCardController.text)) {
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
void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Plan'),
          // content: SingleChildScrollView(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       _buildDetailRow('Device:', widget.deviceName),
          //       _buildDetailRow('Price:', '\$${widget.price.toStringAsFixed(2)}'),
          //       _buildDetailRow('Guarantor Name:', _guarantorNameController.text),
          //       _buildDetailRow('Phone Number:', _phoneNumberController.text),
          //       _buildDetailRow('ID Card Number:', _idCardController.text),
          //       _buildDetailRow('Address:', _addressController.text),
          //       SizedBox(height: 10),
          //       if (selectedPlan != null)
          //         _buildDetailRow(
          //           'Duration:',
          //           '${selectedPlan!['months']} months',
                    
          //         ),
          //           if (selectedPlan != null)
          //         _buildDetailRow(
          //           'Installment price:',
          //           '${(widget.price / selectedPlan!['months']).toStringAsFixed(2)} per month',
                    
          //         ),   
          //     ],
          //   ),
          // ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showPlanDetails(context);
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 89, 3, 97)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Installment Plans'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 246, 232),
                border: Border.all(color: Color.fromARGB(255, 170, 19, 163), width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 0),
                child: Column(
                  children: [
                    Text('Device Name: ${widget.deviceName}', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                    Text('Price of this device: \$${widget.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                    Text('Set an Installment for \$${widget.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 19.0)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Please fill the guarantor details first',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                  onPressed: () => _showGuarantorDetailsModal(context),
                  icon: Icon(
                    Icons.add,
                    size: 40,
                    color: Color.fromARGB(255, 89, 3, 97),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: installmentPlans.length,
                itemBuilder: (context, index) {
                  var plan = installmentPlans[index];
                  return GestureDetector(
                    onTap: () => _selectPlan(index),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: plan['selected'] ? Color.fromARGB(255, 255, 255, 255) : Colors.white,
                        border: Border.all(
                          color: plan['selected'] ? Color.fromARGB(255, 179, 31, 122) : Color.fromARGB(255, 240, 205, 131),
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                            spreadRadius: 4.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${plan['months']} months',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            '\$${(widget.price / plan['months']).toStringAsFixed(2)} / months',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () => _showTermsAndConditions(context),
              child: Text('Terms and Conditions'),
            ),
             CustomButton(
              text: 'Proceed',
              onPressed: () {
                if (_areGuarantorDetailsFilled() && _validateGuarantorDetails()) {
                  _showConfirmationDialog(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Please fill in all the guarantor details correctly',
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
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InstallmentScreen(deviceName: 'Smartphone', price: 1200.0),
  ));
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15.0), backgroundColor: Color.fromARGB(255, 89, 3, 97),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ), // Button color
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white, // Text color
        ),
      ),
    );
  }
}
