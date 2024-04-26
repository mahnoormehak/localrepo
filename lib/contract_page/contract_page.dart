import 'package:flutter/material.dart';

class ContractPage extends StatelessWidget {
  static const String contract = '/contract';
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contract'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contract Title',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae lacinia lacus. Ut venenatis tellus libero, ac laoreet risus euismod vel. Integer vel odio et metus varius scelerisque.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle contract action, e.g., signing or viewing details
              },
              child: const Text('Action'),
            ),
          ],
        ),
      ),
    );
  }
}
