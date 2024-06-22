import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localrepo/seller_side/providers/sellerinfo_controller.dart';
import 'package:localrepo/seller_side/providers/userid.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/button.dart';
import 'package:localrepo/seller_side/widgets/textfield.dart';

class IDCardScreen extends StatelessWidget {
  final IDCardController idCardController = Get.put(IDCardController());

  IDCardScreen();

  Future<void> pickImage(bool isFront) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (isFront) {
        idCardController.frontImage = File(pickedFile.path);
      } else {
        idCardController.backImage = File(pickedFile.path);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = Get.find<UserIdController>().userId.value;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Step 3/4",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "ID Card Details",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('ID Card Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Obx(() {
              final controller = TextEditingController(text: idCardController.idName.value);
              controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
              return CustomTextField(
                controller: controller,
                labelText: 'Enter ID Card name',
                onChanged: (value) => idCardController.idName.value = value,
              );
            }),
            SizedBox(height: 20),
            Text('ID Card Number', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Obx(() {
              final controller = TextEditingController(text: idCardController.idNumber.value);
              controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
              return CustomTextField(
                controller: controller,
                labelText: 'Enter ID Card number',
                onChanged: (value) => idCardController.idNumber.value = value,
                validator: idCardController.validateIDNumber,
              );
            }),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                              Text('Front Image', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                       SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => pickImage(true),
                    child: idCardController.frontImage == null
                        ? Container(
                            height: 170,
                            width: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/placeholder.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                    
                          )
                        : Container(
                            height: 170,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(idCardController.frontImage!, fit: BoxFit.cover),
                            ),
                          ),
                  ),
                                ],),
                ),

                SizedBox(height: 40),
                Expanded(
                  child: Column(
                    children: [
                  Text('Back Image', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                   SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => pickImage(false),
                    child: idCardController.backImage == null
                        ? Container(
                            height: 170,
                            width: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/placeholder.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: 170,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(idCardController.backImage!, fit: BoxFit.cover),
                            ),
                          ),
                  ),
                  ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Center(
              child: CustomButton(
                text: 'Save & Continue',
                onPressed: () => idCardController.saveIDCard(userId),
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
