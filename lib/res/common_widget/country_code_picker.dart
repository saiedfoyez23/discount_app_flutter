// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CountryCodePicker extends StatelessWidget {
  const CountryCodePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contact Field
        CustomText(
          title: "Contact",
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: AppColors.whiteColor,
        ),

        SizedBox(height: 10.h),

        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: Colors.white,
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
    );
  }
}
