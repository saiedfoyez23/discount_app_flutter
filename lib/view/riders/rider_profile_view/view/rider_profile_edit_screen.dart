// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/res/common_widget/picker_dialog.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RiderProfileEditScreen extends StatelessWidget {
  const RiderProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: "Profile",
          color: AppColors.blackColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [


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

              20.heightBox,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: "First name",
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp, color: Colors.black,
                        ),
                        10.heightBox,
                        RoundTextField(hint: "First name"),
                      ],
                    ),
                  ),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: "Last name",
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp, color: Colors.black,
                        ),
                        10.heightBox,
                        RoundTextField(hint: "Last name"),
                      ],
                    ),
                  ),
                ],
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Email address",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp, color: Colors.black,
                  ),
                  10.heightBox,
                  RoundTextField(hint: "roy@roy.com", prefixIcon: Icon(Icons.email_outlined, color: Colors.black54),),
                ],
              ),


              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Location",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp, color: Colors.black,
                  ),
                  10.heightBox,
                  RoundTextField(hint: "London park, UK", prefixIcon: Icon(Icons.location_on_outlined, color: Colors.black54),),
                ],
              ),

              // country code picker
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Contact",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp, color: Colors.black,
                  ),
                  10.heightBox,
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(width: 1, color: Colors.grey)
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


              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(title: "Upload Driving License ",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp, color: Colors.black,
                  ),
                  10.heightBox,

                  Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB84thUuOAO9af8gEgEGb-Gcody8IlQ5dPtA&s",
                    width: width,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ],
              ),

              20.heightBox,
              Roundbutton(
                title: "Update",
                buttonColor: AppColors.primaryColor,
                borderRadius: 6.r,
                onTap: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
