// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/country_code_picker.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:discount_me_app/res/custom_style/custom_size.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class BrokerEditProfileScreen extends StatefulWidget {
  const BrokerEditProfileScreen({super.key});

  @override
  State<BrokerEditProfileScreen> createState() =>
      _BrokerEditProfileScreenState();
}

class _BrokerEditProfileScreenState extends State<BrokerEditProfileScreen> {
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
                  // appbar
                  UserProfileAppbarWidget(
                    onTap: () => Get.back(),
                    title: "Edit Profile"),

//====================== Pick the Profile image ==========================================
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



                  10.heightBox,
                  Row(
                    children: [
                      Expanded
                        (child: CustomTextfieldWithLabel(
                        labelName: "First name",
                        labelTextColor: AppColors.blackColor,
                        hint: "First name",
                      ),
                      ),
                      10.widthBox,
                      Expanded
                        (child:  CustomTextfieldWithLabel(
                        labelName: "Last name",
                        labelTextColor: AppColors.blackColor,
                        hint: "Last name",
                      ),
                      ),
                    ],
                  ),

                  CustomTextfieldWithLabel(
                    labelName: "Email address",
                    labelTextColor: AppColors.blackColor,
                    hint: "roy@roy.com",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  CustomTextfieldWithLabel(
                    labelName: "Location",
                    labelTextColor: AppColors.blackColor,
                    hint: "London park, UK",
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),


                  //================ country code picker=======================
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contact Field
                      CustomText(
                        title: "Contact",
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.blackColor,
                      ),

                      // country code
                      SizedBox(height: 10.h),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Material( // Wrapping with Material
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
                              hintStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                  40.heightBox,
                  Roundbutton(title: "Update",
                    buttonColor: AppColors.secondaryColor,
                    borderRadius: 8.0.r,
                    onTap: () {},)









                ],
              ),
            ),
          ))),
    );
  }
}
