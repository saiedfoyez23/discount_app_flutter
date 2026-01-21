import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_dotted_widget.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class VendorProfileEditScreen extends StatelessWidget {
  const VendorProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      appBar: AppBar(
        title: CustomText(
          title: "Edit Profile",
          color: ColorUtils.blackColor,
          fontSize: 24.sp(context),
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [

              CustomTextfieldWithLabel(
                labelName: "Restaurant Name",
                labelTextColor: ColorUtils.blackColor,
                hint: "Food King Restaurant",
              ),
              CustomTextfieldWithLabel(
                labelName: "Restaurant Description",
                labelTextColor: ColorUtils.blackColor,
                hint: "Food King Restaurant",
              ),
              CustomTextfieldWithLabel(
                labelName: "Email address",
                labelTextColor: ColorUtils.blackColor,
                hint: "roy@roy.com",
                prefixIcon: Icon(Icons.email_outlined),
              ),
              CustomTextfieldWithLabel(
                labelName: "Location",
                labelTextColor: ColorUtils.blackColor,
                hint: "London park, UK",
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              // Number section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CustomText(
                  title: "Contact",
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp(context),
                  color: ColorUtils.blackColor,
                ),
                  10.heightBox,
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.w(context)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r(context)),
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
                          hintText: '+8801629958550',
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
                children: [
                  CustomText(
                    title: "Update Cover Photo",
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp(context),
                    color: ColorUtils.blackColor,
                  ),
                  10.heightBox,
                 CustomDottedWidget(),
                ],
              ),

              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: "Update Tax Document",
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp(context),
                    color: ColorUtils.blackColor,
                  ),
                  10.heightBox,
                  CustomDottedWidget(),
                ],
              ),

              20.heightBox,
              Roundbutton(
                  title: "Update",
                  borderRadius: 8.r(context),
                  buttonColor: ColorUtils.secondaryColor,
                  onTap: (){},
              ),

              40.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
