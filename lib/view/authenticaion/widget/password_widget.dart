// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/authenticaion/controller/password_controller.dart';

class PasswordWidget extends StatelessWidget {
  final TextEditingController? controller;
  PasswordWidget({super.key, this.controller});


  final PasswordController passwordController = Get.put(PasswordController()); // Initialize the controller
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: "Password",
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.whiteColor,
          ),
          SizedBox(height: 10),
          // Password Field
          Obx(() => TextField(
            controller: controller,
            obscureText: !passwordController.isPasswordVisible.value,
            decoration: InputDecoration(
              filled: true,
              hintText: "************",
              fillColor: AppColors.whiteColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.r)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
                  borderRadius: BorderRadius.circular(8.r)
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  passwordController.isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: passwordController.togglePasswordVisibility,
              ),
            ),
          ),
          ),

          SizedBox(height: 20),

          // Confirm Password Field
          CustomText(
            title: "Confirm Password",
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.whiteColor,
          ),
          SizedBox(height: 10),
          Obx(() => TextField(
            obscureText: !passwordController.isConfirmPasswordVisible.value,
            decoration: InputDecoration(
              hintText: "************",
              filled: true,
              fillColor: AppColors.whiteColor,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.r)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
                  borderRadius: BorderRadius.circular(8.r)
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  passwordController.isConfirmPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: passwordController.toggleConfirmPasswordVisibility,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
