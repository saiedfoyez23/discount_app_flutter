import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';


class SignUpVerifyScreenController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 1),() async {
      Get.off(()=> SignInScreen(), duration: const Duration(milliseconds: 100),preventDuplicates: false);
    });
  }

}
