// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/users/profile_view/controller/change_password_controller.dart';

class RiderChangePasswordScreen extends StatelessWidget {
  RiderChangePasswordScreen({super.key});

  final ChangePasswordController passwordController = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(AppImages.homeBg),
            alignment: Alignment.topRight,
            opacity: 0.5),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // appBar
                  10.heightBox,
                  UserProfileAppbarWidget(title: "Change Password", onTap: () => Get.back(),),

                  // Current Password Field
                  50.heightBox,
                  Obx(
                        () => Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.greenLight,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.lock_outline, color: Colors.black54),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              obscureText: !passwordController.isCurrentPasswordVisible.value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Current Password',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              passwordController.isCurrentPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black54,
                            ),
                            onPressed: passwordController.toggleCurrentPasswordVisibility,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // New Password Field
                  Obx(
                        () => Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.greenLight,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.lock_outline, color: Colors.black54),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              obscureText: !passwordController.isNewPasswordVisible.value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'New Password',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              passwordController.isNewPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black54,
                            ),
                            onPressed: passwordController.toggleNewPasswordVisibility,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Confirm Password Field
                  Obx(
                        () => Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.greenLight,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.lock_outline, color: Colors.black54),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              obscureText: !passwordController.isConfirmPasswordVisible.value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirm New Password',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              passwordController.isConfirmPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black54,
                            ),
                            onPressed: passwordController.toggleConfirmPasswordVisibility,
                          ),
                        ],
                      ),
                    ),
                  ),

                  10.heightBox,
                  GestureDetector(
                    onTap: () {
                      //Get.to(ForgotPaswordScreen());
                    },
                    child: CustomText(
                      title: "Forgot the password?",
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),



                  40.heightBox,
                  Roundbutton(title: "Confirm",
                      buttonColor: AppColors.primaryColor,
                      borderRadius: 8.r,
                      onTap: (){}
                  )



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
