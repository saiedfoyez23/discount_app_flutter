// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/country_code_picker.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:discount_me_app/res/common_widget/picker_dialog.dart';
import 'package:discount_me_app/view/authenticaion/view/sign_up_preview_screen.dart';
import 'package:discount_me_app/view/authenticaion/widget/password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrokerSignUpScreen extends StatefulWidget {
  BrokerSignUpScreen({super.key});

  @override
  _BrokerSignUpScreenState createState() => _BrokerSignUpScreenState();
}

class _BrokerSignUpScreenState extends State<BrokerSignUpScreen> {
  // Local state for radio button value
  String _selectedRole = "Broker";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.authBg),
          fit: BoxFit.fill,
          opacity: 0.3,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
//====================== App bar ==========================================
                  CustomAppBar(
                    appBarName: "Create Account",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

//====================== Pick the Profile image ==========================================
                  SizedBox(height: 20.h),
                  Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          AppImages.imagePickerIcon,
                          scale: 4.w.h,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => PickerDialog().showImagePickerDialog(context),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.secondaryColor,
                                size: 28.w.h,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

/*================================= User type (Radio buttons) =================================================================================*/
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio<String>(
                        value: "Broker",
                        groupValue: _selectedRole,
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value!;
                          });
                        },
                        activeColor: const Color(0xffff7d29),
                      ),
                      CustomText(
                        title: "Broker",
                        fontSize: 16.sp,
                        color: const Color(0xffff7d29),
                      ),
                    ],
                  ),

/*================================= Form section =================================================================================*/
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextfieldWithLabel(
                            labelName: "First name",
                          hint: "First name",
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomTextfieldWithLabel(
                            labelName: "Last name",
                          hint: "Last name",
                        ),
                      ),
                    ],
                  ),

                  CustomTextfieldWithLabel(
                    labelName: "Email address",
                    hint: "roy@roy.com",
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.black),
                  ),

                  CustomTextfieldWithLabel(
                    labelName: "Location",
                    hint: "London park, UK",
                    prefixIcon: Icon(Icons.location_on_outlined, color: Colors.black),
                  ),

//================ country code picker=======================
                  //CountryCodePicker(),

//====================== Password section =======================
                  SizedBox(height: 20.h),
                  PasswordWidget(),

//====================== Sign Up button =======================
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPreviewScreen()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: CustomText(
                        title: "Sign Up",
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
