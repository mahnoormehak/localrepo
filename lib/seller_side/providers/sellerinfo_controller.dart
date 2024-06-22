import 'dart:io';

import 'package:get/get.dart';
import 'package:localrepo/seller_side/database/sellerinfo_db.dart';
import 'package:localrepo/seller_side/providers/userid.dart';
import 'package:localrepo/seller_side/screens/register/address.dart';
import 'package:localrepo/seller_side/screens/register/bankinfo.dart';
import 'package:localrepo/seller_side/screens/register/id.dart';
class UserController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password cannot be empty';
    }
    if (value != password.value) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> createUser() async {
    if (validateEmail(email.value) == null && validateConfirmPassword(confirmPassword.value) == null) {
      int userId = await DatabaseHelper().insertUser({
        'email': email.value,
        'password': password.value,
      });
      Get.find<UserIdController>().setUserId(userId);
      Get.snackbar('Success', 'Account created successfully');
      email.value = '';
      password.value = '';
      confirmPassword.value = '';
      Get.to(() => AddressScreen());
    }
  }
}

class AddressController extends GetxController {
  var businessAddress = ''.obs;
  var warehouseAddress = ''.obs;
  var returnAddress = ''.obs;
  var isWarehouseSameAsBusiness = false.obs;
  var isReturnSameAsBusiness = false.obs;

  void setWarehouseSameAsBusiness(bool value) {
    isWarehouseSameAsBusiness.value = value;
    if (value) {
      warehouseAddress.value = businessAddress.value;
    } else {
      warehouseAddress.value = '';
    }
  }

  void setReturnSameAsBusiness(bool value) {
    isReturnSameAsBusiness.value = value;
    if (value) {
      returnAddress.value = businessAddress.value;
    } else {
      returnAddress.value = '';
    }
  }

  Future<void> saveAddress(int userId) async {
    await DatabaseHelper().insertAddress({
      'user_id': userId,
      'business_address': businessAddress.value,
      'warehouse_address': warehouseAddress.value,
      'return_address': returnAddress.value,
    });
    Get.snackbar('Success', 'Address details saved');
    Get.to(() => IDCardScreen());
  }
}


class IDCardController extends GetxController {
  var idName = ''.obs;
  var idNumber = ''.obs;
  File? frontImage;
  File? backImage;

  String? validateIDNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'ID number cannot be empty';
    }
    if (!RegExp(r'^\d{13}$').hasMatch(value)) {
      return 'ID number must be 13 digits long';
    }
    return null;
  }

  Future<void> saveIDCard(int userId) async {
    await DatabaseHelper().insertIdCard({
      'user_id': userId,
      'id_name': idName.value,
      'id_number': idNumber.value,
      'front_image_path': frontImage?.path,
      'back_image_path': backImage?.path,
    });
    Get.snackbar('Success', 'ID Card details saved');
    Get.to(() => BankInfoScreen());
  }
}

class BankInfoController extends GetxController {
  var bankName = ''.obs;
  var accountHolderName = ''.obs;
  var accountNumber = ''.obs;
  var branchCode = ''.obs;
  var iban = ''.obs;

  String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Account number cannot be empty';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Account number must be numeric';
    }
    return null;
  }

  String? validateIBAN(String? value) {
    if (value == null || value.isEmpty) {
      return 'IBAN cannot be empty';
    }
    // Add your specific IBAN validation logic here
    return null;
  }

  Future<void> saveBankInfo(int userId) async {
    await DatabaseHelper().insertBankInfo({
      'user_id': userId,
      'bank_name': bankName.value,
      'account_holder_name': accountHolderName.value,
      'account_number': accountNumber.value,
      'branch_code': branchCode.value,
      'iban': iban.value,
    });
    Get.snackbar('Success', 'Bank information saved');
  }
}

