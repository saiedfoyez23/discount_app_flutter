// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/view/broker_home.dart';
import 'package:discount_me_app/view/riders/home_view/view/rider_home.dart';
import 'package:discount_me_app/view/vendors/vendor_home_view/view/vendor_home.dart';

class AuthController extends GetxController{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  void getLogin() {
    if(emailController.text.isEmpty && passwordController.text.isEmpty){
      Get.snackbar("Error", "Email and Password fill is empty", backgroundColor: Colors.red, colorText: Colors.white);
    }else
    if(emailController.text == 'user@gmail.com' && passwordController.text == '123456'){
      Get.to(const UserHome());
      Get.snackbar("Login Success", "Welcome to discount me restaurant",backgroundColor: Colors.green, colorText: Colors.white);

    }else if(emailController.text == 'rider@gmail.com' && passwordController.text == '123456'){
      Get.to(RiderHome());
      Get.snackbar("Login Success", "Welcome to discount me restaurant",backgroundColor: Colors.green, colorText: Colors.white);

    }else if(emailController.text == 'vendor@gmail.com' && passwordController.text == '123456'){
      Get.to(VendorHome());
      Get.snackbar("Login Success", "Welcome to discount me restaurant",backgroundColor: Colors.green, colorText: Colors.white);
    }else if(emailController.text == 'broker@gmail.com' && passwordController.text == '123456'){
      Get.to(BrokerHome());
      Get.snackbar("Login Success", "Welcome to discount me restaurant",backgroundColor: Colors.green, colorText: Colors.white);
    }else{
      Get.snackbar("Error", "Email and Password dosen\'t match", backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}