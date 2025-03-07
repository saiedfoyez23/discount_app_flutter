// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';

class VendorChangePasswordScreen extends StatefulWidget {
  const VendorChangePasswordScreen({super.key});

  @override
  State<VendorChangePasswordScreen> createState() => _VendorChangePasswordScreenState();
}

class _VendorChangePasswordScreenState extends State<VendorChangePasswordScreen> {
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Toggles the visibility of current password
  void _toggleCurrentPasswordVisibility() {
    setState(() {
      _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
    });
  }

  // Toggles the visibility of new password
  void _toggleNewPasswordVisibility() {
    setState(() {
      _isNewPasswordVisible = !_isNewPasswordVisible;
    });
  }

  // Toggles the visibility of confirm password
  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

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
                  SizedBox(height: 10),
                  UserProfileAppbarWidget(
                    title: "Change Password",
                    onTap: () => Navigator.pop(context),
                  ),

                  // Current Password Field
                  SizedBox(height: 50),
                  Container(
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
                            obscureText: !_isCurrentPasswordVisible,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Current Password',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _isCurrentPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                          onPressed: _toggleCurrentPasswordVisibility,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // New Password Field
                  Container(
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
                            obscureText: !_isNewPasswordVisible,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'New Password',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _isNewPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                          onPressed: _toggleNewPasswordVisibility,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Confirm Password Field
                  Container(
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
                            obscureText: !_isConfirmPasswordVisible,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm New Password',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                          onPressed: _toggleConfirmPasswordVisibility,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  GestureDetector(
                    onTap: () {
                      // Navigate to Forgot Password screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                      // );
                    },
                    child: CustomText(
                      title: "Forgot the password?",
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Confirm button
                  Roundbutton(
                    title: "Confirm",
                    buttonColor: AppColors.primaryColor,
                    borderRadius: 8.r,
                    onTap: () {
                      // Handle password change confirmation
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
