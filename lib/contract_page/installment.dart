
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:localrepo/contract_page/gurantor.dart';
import 'package:localrepo/custom_widgets/button.dart';
import 'package:signature/signature.dart';

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
  final TextEditingController _digitalSignatureController = TextEditingController();
  

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
      final double totalCost = widget.price;
      final double monthlyPayment = totalCost / selectedPlan!['months'];
      final double interest = (totalCost * selectedPlan!['rate']) / 100;
      final double totalPayment = totalCost + interest;
      final double latePaymentPenalty = 500.0; // Example penalty amount
      final double prepaymentPenalty = 500.0; // Example penalty amount
      final String collateralDescription = 'Item being financed: ${widget.deviceName}';
   //   final List<String> dueDates = List.generate(selectedPlan!['months'], (i) => 'Due date ${i + 1}'); // Example due dates

      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Installment Plan Details',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
               // SizedBox(height: 20.0),
                _buildDetailRow('Monthly payment:', '\$${monthlyPayment.toStringAsFixed(2)}'),
                _buildDetailRow('Total payment:', '\$${totalPayment.toStringAsFixed(2)}'),
                _buildDetailRow('Late Payment Penalty:', '\$${latePaymentPenalty.toStringAsFixed(2)}'),
                _buildDetailRow('Prepayment Penalty:', '\$${prepaymentPenalty.toStringAsFixed(2)}'),
                _buildDetailRow('Collateral:', collateralDescription),
             //   _buildDetailRow('Due Dates:', dueDates.join(', ')),
             //   SizedBox(height: 20.0),
                
                Center(
                  child: CustomButton(text: 'Confirm Plan', onPressed: (){
                    Navigator.pop(context);
                       ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Plan Confirmed',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                 //     fontWeight: FontWeight.bold
                    ),
                  ),
                   backgroundColor: Color.fromARGB(255, 243, 146, 186),
                  action: SnackBarAction(
                    label: 'OK',
                    textColor: Colors.black,
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ),
              
                      );
                  }),
                )
              ],
            ),
          );
        },
      );
    } else {
      
       ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Please select an installment plan.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                 //     fontWeight: FontWeight.bold
                    ),
                  ),
                   backgroundColor: Color.fromARGB(255, 243, 146, 186),
                  action: SnackBarAction(
                    label: 'OK',
                    textColor: Colors.black,
                    onPressed: () {
                      // Some code to undo the change.
                    },
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
            CustomButton(
              text: 'Close',
              onPressed: () {
                Navigator.of(context).pop();
              },
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
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
                TextField(
                  controller: _idCardController,
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
            CustomButton(
              text: 'Save',
              onPressed: () {
                if (_areGuarantorDetailsFilled()) {
                  Navigator.of(context).pop();
                 ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Guarantor details saved!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                 //     fontWeight: FontWeight.bold
                    ),
                  ),
                   backgroundColor: Color.fromARGB(255, 243, 146, 186),
                  action: SnackBarAction(
                    label: 'OK',
                    textColor: Colors.black,
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ),
              
                  );
                } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Please fill in all the details',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                 //     fontWeight: FontWeight.bold
                    ),
                  ),
                  backgroundColor: Color.fromARGB(255, 243, 146, 186),
                  action: SnackBarAction(
                    label: 'OK',
                    textColor: Colors.black,
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ),
              );
                }
              },
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

  bool _areGuarantorDetailsFilled() {
    return _guarantorNameController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _idCardController.text.isNotEmpty &&
        _addressController.text.isNotEmpty;
        //_digitalSignatureController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Installment Plans '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          
               Container(
                height: 140,
             //   width: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 250, 246, 232),
border: Border.all(color: Color.fromARGB(255, 170, 19, 163),width: 3),

borderRadius: BorderRadius.circular(20,)

               
                      ),
                
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(10.0,10,10,0),
                   child:               Column(
                     children: [
                      Text('Device Name: ${widget.deviceName}',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
                       Text(
                                         'Price of this device: \$${widget.price.toStringAsFixed(2)}',
                                         style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
                                   ),
                              Text(
                                         'Set an Installment  for \$${widget.price.toStringAsFixed(2)}',
                                         style: TextStyle(fontSize: 19.0,),
                                   ),      
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
      
         
            TextButton(onPressed: () => _showTermsAndConditions(context),
              child: Text('Terms and Conditions')
            ),
            CustomButton(
              text: 'Proceed',
              onPressed: () {
                if (_areGuarantorDetailsFilled()) {
                  _showPlanDetails(context);
                } else {
                   ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Please fill in all the guarantor details',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                 //     fontWeight: FontWeight.bold
                    ),
                  ),
                   backgroundColor: Color.fromARGB(255, 243, 146, 186),
                  action: SnackBarAction(
                    label: 'OK',
                    textColor: Colors.black,
                    onPressed: () {
                      // Some code to undo the change.
                    },
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




