import 'dart:io';

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(milliseconds: 100),() async {
      await resetFunction();
    });
  }

  Rx<File> imageFile = File("").obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> restaurantNameController = TextEditingController().obs;
  Rx<TextEditingController> restaurantDescriptionController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  RxString contact = "".obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  Rx<File> documentFile = File("").obs;
  Rx<File> drivingLicenceFile = File("").obs;
  Rx<File> coverFile = File("").obs;
  Rx<File> taxFile = File("").obs;
  RxString selectedRole = "User".obs;
  RxList<String> positions = [
    'Federal Government Official',
    'State Government Official',
    'City Council Member',
    'Mayor',
    'Senator',
    'Congressperson',
    'Police Officer',
    'Firefighter',
    'Public School Teacher',
    'Healthcare Worker',
    'Other'
  ].obs;
  RxString selectedPosition = "".obs;

  Future<void> changeRole(String value) async {
    selectedRole.value = value;
  }

  RxBool isPasswordVisible = false.obs;   // For first password field
  RxBool isConfirmPasswordVisible = false.obs; // For confirm password field

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }


  Future<void> resetFunction() async {
    imageFile = File("").obs;
    firstNameController = TextEditingController().obs;
    lastNameController = TextEditingController().obs;
    restaurantNameController = TextEditingController().obs;
    restaurantDescriptionController = TextEditingController().obs;
    emailController = TextEditingController().obs;
    locationController = TextEditingController().obs;
    contact = "".obs;
    selectedPosition = "".obs;
    passwordController = TextEditingController().obs;
    confirmPasswordController = TextEditingController().obs;
    documentFile = File("").obs;
    drivingLicenceFile = File("").obs;
    coverFile = File("").obs;
    taxFile = File("").obs;
    isPasswordVisible = false.obs;
    isConfirmPasswordVisible = false.obs;
  }


}