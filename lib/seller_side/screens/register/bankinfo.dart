import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/seller_side/providers/sellerinfo_controller.dart';
import 'package:localrepo/seller_side/providers/userid.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/button.dart';
import 'package:localrepo/seller_side/widgets/navbar.dart';
import 'package:localrepo/seller_side/widgets/textfield.dart';

class BankInfoScreen extends StatelessWidget {
  final BankInfoController bankInfoController = Get.put(BankInfoController());

  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountHolderNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController branchCodeController = TextEditingController();
  final TextEditingController ibanController = TextEditingController();

  BankInfoScreen() {
    bankNameController.text = bankInfoController.bankName.value;
    accountHolderNameController.text = bankInfoController.accountHolderName.value;
    accountNumberController.text = bankInfoController.accountNumber.value;
    branchCodeController.text = bankInfoController.branchCode.value;
    ibanController.text = bankInfoController.iban.value;
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
                "Step 4/4",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Bank Information",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
            Text('Bank Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Obx(() {
              bankNameController.value = TextEditingValue(
                text: bankInfoController.bankName.value,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: bankInfoController.bankName.value.length),
                ),
              );
              return CustomTextField(
                controller: bankNameController,
                labelText: 'Enter bank name',
                onChanged: (value) => bankInfoController.bankName.value = value,
              );
            }),
            SizedBox(height: 20),
            Text('Account Holder Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Obx(() {
              accountHolderNameController.value = TextEditingValue(
                text: bankInfoController.accountHolderName.value,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: bankInfoController.accountHolderName.value.length),
                ),
              );
              return CustomTextField(
                controller: accountHolderNameController,
                labelText: 'Enter account holder name',
                onChanged: (value) => bankInfoController.accountHolderName.value = value,
              );
            }),
            SizedBox(height: 20),
            Text('Account Number', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Obx(() {
              accountNumberController.value = TextEditingValue(
                text: bankInfoController.accountNumber.value,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: bankInfoController.accountNumber.value.length),
                ),
              );
              return CustomTextField(
                controller: accountNumberController,
                labelText: 'Enter account number',
                onChanged: (value) => bankInfoController.accountNumber.value = value,
                validator: bankInfoController.validateAccountNumber,
              );
            }),
            SizedBox(height: 20),
            Text('Branch Code', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Obx(() {
              branchCodeController.value = TextEditingValue(
                text: bankInfoController.branchCode.value,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: bankInfoController.branchCode.value.length),
                ),
              );
              return CustomTextField(
                controller: branchCodeController,
                labelText: 'Enter branch code',
                onChanged: (value) => bankInfoController.branchCode.value = value,
              );
            }),
            SizedBox(height: 20),
            Text('IBAN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Obx(() {
              ibanController.value = TextEditingValue(
                text: bankInfoController.iban.value,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: bankInfoController.iban.value.length),
                ),
              );
              return CustomTextField(
                controller: ibanController,
                labelText: 'Enter IBAN',
                onChanged: (value) => bankInfoController.iban.value = value,
                validator: bankInfoController.validateIBAN,
              );
            }),
            SizedBox(height: 20),
            Center(
              child: CustomButton(
                text: 'Finish',
                onPressed: (){ 
                  bankInfoController.saveBankInfo(userId);
                  Get.to(()=>NavBarScreen());
                },
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
