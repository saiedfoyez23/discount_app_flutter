import 'package:discount_me_app/res/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfieldWithLabel extends StatelessWidget {
  final VoidCallback? onTap;
  final String labelName;
  final bool readOnly;
  final TextEditingController? controller;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Color focusColor;
  final Color labelTextColor;


  const CustomTextfieldWithLabel({
    super.key,
    required this.labelName,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.focusColor = ColorUtils.secondaryColor,
    this.labelTextColor = ColorUtils.whiteColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: labelName,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp(context),
          color: labelTextColor,
        ),

        SizedBox(height: 10.h(context)),

        Material( // Wrap the TextField with Material
          color: Colors.transparent, // Keep it transparent if needed
          child: TextField(
            readOnly: readOnly,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focusColor, width: 1),
                borderRadius: BorderRadius.circular(8.r(context)),
              ) ,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorUtils.whiteNormalActive, width: 0.5),
                borderRadius: BorderRadius.circular(8.r(context)),
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hint,
              hintStyle: GoogleFonts.urbanist(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp(context),
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h(context)),
      ],
    );
  }
}
