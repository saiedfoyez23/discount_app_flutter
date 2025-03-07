// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/res/common_widget/country_code_picker.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:discount_me_app/res/common_widget/picker_dialog.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class UserProfileEditScreen extends StatelessWidget {
  const UserProfileEditScreen({super.key});

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
                  UserProfileAppbarWidget(
                    title: "Edit Profile",
                    onTap: () {
                      Get.back();
                    },
                  ),

                  // profile image
                  20.heightBox,
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
                            onTap: () =>
                                PickerDialog().showImagePickerDialog(context),
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

                  20.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextfieldWithLabel(
                            labelTextColor: Colors.black,
                        labelName: "First name",
                        hint: "First name",
                      ),),
                      10.widthBox,
                      Expanded(
                          child: CustomTextfieldWithLabel(
                            labelTextColor: Colors.black,
                        labelName: "Last name",
                        hint: "Last name",
                      ),),
                    ],
                  ),
                  CustomTextfieldWithLabel(
                    labelTextColor: Colors.black,
                    labelName: "Email",
                    hint: "roy@roy.com",
                  ),

                  CustomTextfieldWithLabel(
                    labelTextColor: Colors.black,
                    labelName: "Are you a first responder or EBT card holder",
                    hint: "Police",
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "EBT Documents",
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                      10.heightBox,
                      Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/c/cd/Washington_State_Enhanced_Driver%27s_License_-_Sample.webp",
                        height: 200.h, width: width, fit: BoxFit.cover,)
                          ??Container(
                            height: 200.h,
                            width: width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: Text("EBT Documents is empty"),
                          )
                    ],
                  ),
                  20.heightBox,
                  CustomTextfieldWithLabel(
                    labelTextColor: Colors.black,
                    labelName: "Location",
                    hint: "London park, UK",
                  ),

                  // country code picker
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "Contact",
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                      10.heightBox,
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: Material(
                          // Wrapping with Material
                          color: Colors.transparent, // Keep transparent if needed
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              useEmoji: true,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: const TextStyle(color: Colors.black),
                            initialValue: PhoneNumber(isoCode: 'BD'),
                            formatInput: true,
                            inputDecoration: const InputDecoration(
                              hintText: 'Enter your number',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  40.heightBox,
                  Roundbutton(
                    title: "Update",
                    buttonColor: AppColors.primaryColor,
                    borderRadius: 6.r,
                    onTap: () {},
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
