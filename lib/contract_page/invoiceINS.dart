import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localrepo/Database/authentication.dart';
import 'package:localrepo/custom_widgets/button.dart';

class InvoiceScreen extends StatelessWidget {
  final String deviceName;
  final double price;
  final Map<String, dynamic> selectedPlan;
  final String guarantorName;
  final String phoneNumber;
  final String idCardNumber;
  final String address;
  final Map<String, dynamic> userData; // Accept user data as a parameter

  InvoiceScreen({
    required this.deviceName,
    required this.price,
    required this.selectedPlan,
    required this.guarantorName,
    required this.phoneNumber,
    required this.idCardNumber,
    required this.address,
    required this.userData, // Accept user data as a parameter
  });

  @override
  Widget build(BuildContext context) {
    final double totalCost = price;
    final double monthlyPayment = totalCost / selectedPlan['months'];
    final double interest = (totalCost * selectedPlan['rate']) / 100;
    final double totalPayment = totalCost + interest;
    final double latePaymentPenalty = 500.0; // Example penalty amount
    final double prepaymentPenalty = 500.0; // Example penalty amount
    final String collateralDescription = 'Item being financed: $deviceName';

    return Scaffold(
       appBar: AppBar(title: Text('Invoice Screen'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
                        
     
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30,0,30,0),
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
                      _buildSectionTitle('Device Information'),
                      _buildInfoRow('Device Name:', deviceName),
                      _buildInfoRow('Price:', '\$${price.toStringAsFixed(2)}'),
                      SizedBox(height: 20.0),
                      _buildSectionTitle('Guarantor Information'),
                      _buildInfoRow('Name:', guarantorName),
                      _buildInfoRow('Phone:', phoneNumber),
                      _buildInfoRow('ID Card Number:', idCardNumber),
                      _buildInfoRow('Address:', address),
                  //    SizedBox(height: 20.0),
                   
                      SizedBox(height: 20.0),
                      _buildSectionTitle('Installment Plan'),
                      _buildInfoRow('Duration:', '${selectedPlan['months']} months'),
                      _buildInfoRow('Monthly Payment:', '\$${monthlyPayment.toStringAsFixed(2)}'),
                      _buildInfoRow('Total Payment:', '\$${totalPayment.toStringAsFixed(2)}'),
                      _buildInfoRow('Late Payment Penalty:', '\$${latePaymentPenalty.toStringAsFixed(2)}'),
                      _buildInfoRow('Prepayment Penalty:', '\$${prepaymentPenalty.toStringAsFixed(2)}'),
                      _buildInfoRow('Collateral:', collateralDescription),
                      SizedBox(height: 50.0),
                         Row(
                        children: [
                          Expanded(child: CustomButton(text: 'OK', onPressed: (){})),
                        ],
                      ),
                   SizedBox(height: 20,)
                    ],
                  ),
                  
                ),
                
              ),
            ],
          ),
          
        ),
      ),
    );
  }

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



void main() {
  runApp(MaterialApp(
    home: InvoiceScreen(
      deviceName: 'Smartphone',
      price: 1200.0,
      selectedPlan: {'months': 12, 'rate': 5.0},
      guarantorName: 'John Doe',
      phoneNumber: '123-456-7890',
      idCardNumber: 'A12345678',
      address: '123 Main St, Anytown, USA', userData: {},
      
    ),
  ));
}
