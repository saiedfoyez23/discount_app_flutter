import 'package:get/get.dart';

class PasswordController extends GetxController {
  
  var isPasswordVisible = false.obs;   // For first password field
  var isConfirmPasswordVisible = false.obs; // For confirm password field

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }
}
