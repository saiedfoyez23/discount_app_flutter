import 'package:get/get.dart';

class RadioController extends GetxController {
  var selectedRole = "User".obs; // Default selection

  void changeRole(String value) {
    selectedRole.value = value;
  }
}
