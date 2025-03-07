import 'package:get/get.dart';

enum PaymentMethod { creditCard, paypal, applePay }

class PaymentMethodController extends GetxController {
  var selectedMethod = PaymentMethod.creditCard.obs;

  void selectMethod(PaymentMethod method) {
    selectedMethod.value = method;
  }
}
