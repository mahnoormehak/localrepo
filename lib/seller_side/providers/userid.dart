import 'package:get/get.dart';
class UserIdController extends GetxController {
  var userId = 0.obs; // Observable to hold userId

  void setUserId(int id) {
    userId.value = id;
  }
  
  int get getUserId => userId.value;

}
