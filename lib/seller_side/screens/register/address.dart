import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/seller_side/providers/sellerinfo_controller.dart';
import 'package:localrepo/seller_side/providers/userid.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/button.dart';
import 'package:localrepo/seller_side/widgets/textfield.dart';

class AddressScreen extends StatelessWidget {
  final AddressController addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    final userId = Get.find<UserIdController>().userId.value; // Retrieve userId

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Step 2/4",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Add Address Details",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Business Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            CustomTextField(
              controller: TextEditingController(text: addressController.businessAddress.value),
              labelText: 'Enter your business address',
              onChanged: (value) => addressController.businessAddress.value = value,
              maxLines: 3,
            ),
            SizedBox(height: 20),
            Obx(() => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Warehouse Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text('Same as Business'),
                        Switch(
                          value: addressController.isWarehouseSameAsBusiness.value,
                          onChanged: (value) => addressController.setWarehouseSameAsBusiness(value),
                        ),
                      ],
                    ),
                  ],
                ),
                if (!addressController.isWarehouseSameAsBusiness.value) ...[
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: TextEditingController(text: addressController.warehouseAddress.value),
                    labelText: 'Enter your warehouse address',
                    onChanged: (value) => addressController.warehouseAddress.value = value,
                    maxLines: 3,
                  ),
                ],
              ],
            )),
            SizedBox(height: 20),
            Obx(() => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Return Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text('Same as Business'),
                        Switch(
                          value: addressController.isReturnSameAsBusiness.value,
                          onChanged: (value) => addressController.setReturnSameAsBusiness(value),
                        ),
                      ],
                    ),
                  ],
                ),
                if (!addressController.isReturnSameAsBusiness.value) ...[
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: TextEditingController(text: addressController.returnAddress.value),
                    labelText: 'Enter your return address',
                    onChanged: (value) => addressController.returnAddress.value = value,
                    maxLines: 3,
                  ),
                ],
              ],
            )),
            SizedBox(height: 20),
            Center(
              child: CustomButton(
                text: 'Save & Continue',
                onPressed: () => addressController.saveAddress(userId),
                color: AppColors.btncolor,
                fontcolor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
