import 'package:get/get.dart';

class PaymentInfoController extends GetxController {
  // Observable variable for card number visibility
  var isCardNumberObscured = true.obs;

  // Method to toggle visibility
  void toggleCardNumberVisibility() {
    isCardNumberObscured.value = !isCardNumberObscured.value;
  }
}
