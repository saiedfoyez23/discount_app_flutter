// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/authenticaion/controller/create_password_controller.dart';

class CreatePasswordWidget extends StatelessWidget {
  final CreatePasswordController passwordController = Get.put(CreatePasswordController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Update Password Text
          CustomText(
            title: "Enter your new password", // Updated title
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.whiteColor,
          ),
          SizedBox(height: 10),
          // Password Field
          Obx(() => TextField(
            obscureText: !passwordController.isNewPasswordVisible.value,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  passwordController.isNewPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: passwordController.toggleNewPasswordVisibility,
              ),
            ),
          )),

          SizedBox(height: 20),

          // Update Confirm Password Text
          CustomText(
            title: "Confirm your new password", // Updated title
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.whiteColor,
          ),
          SizedBox(height: 10),
          Obx(() => TextField(
            obscureText: !passwordController.isNewConfirmPasswordVisible.value,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  passwordController.isNewConfirmPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: passwordController.toggleNewConfirmPasswordVisibility,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
