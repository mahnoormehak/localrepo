import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/seller_side/database/sellerinfo_db.dart';
import 'package:localrepo/seller_side/providers/userid.dart';

class EditAddressScreen extends StatefulWidget {
  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final DatabaseHelper databaseHelper = Get.find<DatabaseHelper>();
  final int userId = Get.find<UserIdController>().getUserId;

  final TextEditingController businessAddressController = TextEditingController();
  final TextEditingController warehouseAddressController = TextEditingController();
  final TextEditingController returnAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserAddresses();
  }

  Future<void> _loadUserAddresses() async {
    final userData = await databaseHelper.getUserData(userId);

    setState(() {
      businessAddressController.text = userData['address']?['business_address'] ?? '';
      warehouseAddressController.text = userData['address']?['warehouse_address'] ?? '';
      returnAddressController.text = userData['address']?['return_address'] ?? '';
    });
  }

  Future<void> _saveAddresses() async {
    final address = {
      'user_id': userId,
      'business_address': businessAddressController.text,
      'warehouse_address': warehouseAddressController.text,
      'return_address': returnAddressController.text,
    };

    await databaseHelper.insertAddress(address);
    Get.back(); // Go back to the previous screen
  }

  @override
  void dispose() {
    businessAddressController.dispose();
    warehouseAddressController.dispose();
    returnAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Address'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveAddresses,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: businessAddressController,
              decoration: InputDecoration(
                labelText: 'Business Address',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: warehouseAddressController,
              decoration: InputDecoration(
                labelText: 'Warehouse Address',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: returnAddressController,
              decoration: InputDecoration(
                labelText: 'Return Address',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
