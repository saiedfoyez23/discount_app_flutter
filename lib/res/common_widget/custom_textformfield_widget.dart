import 'package:discount_me_app/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormFieldWidget {


  Widget normalTextFormFiledWidgetWithIcon({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    TextInputType textInputType = TextInputType.text,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      style: GoogleFonts.urbanist(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp(context),
        color: AppColors.black29,
      ),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: 64.h(context),
          maxWidth: 428.w(context),
        ),
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: AppColors.white253,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.orange125, width: 1),
          borderRadius: BorderRadius.circular(8.r(context)),
        ) ,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white202, width: 0.5),
          borderRadius: BorderRadius.circular(8.r(context)),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: GoogleFonts.urbanist(
          fontWeight: FontWeight.w400,
          fontSize: 20.sp(context),
          color: AppColors.black114,
        ),
      ),
    );
  }


  Widget normalTextFormFiledWidget({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    TextInputType textInputType = TextInputType.text,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      style: GoogleFonts.urbanist(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp(context),
        color: AppColors.white253,
      ),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: 44.h(context),
          maxWidth: 428.w(context),
        ),
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: GoogleFonts.urbanist(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp(context),
          color: AppColors.white253,
        ),
      ),
    );
  }



  Widget passwordTextFormFieldWidgetWithIcon({
    required BuildContext context,
    required TextEditingController controller,
    required bool obscureText,
    required String hintText,
    TextInputType textInputType = TextInputType.text,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      style: GoogleFonts.urbanist(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp(context),
        color: AppColors.black29,
      ),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: 64.h(context),
          maxWidth: 428.w(context),
        ),
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: AppColors.white253,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.orange125, width: 1),
          borderRadius: BorderRadius.circular(8.r(context)),
        ) ,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white202, width: 0.5),
          borderRadius: BorderRadius.circular(8.r(context)),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: GoogleFonts.urbanist(
          fontWeight: FontWeight.w400,
          fontSize: 20.sp(context),
          color: AppColors.black114,
        ),
      ),
    );
  }


  Widget otpTextFormFieldWidget({
    required BuildContext context,
    required TextEditingController controller,
    required String? Function(String) onChange,
  }) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: onChange,
      style: GoogleFonts.urbanist(
        fontWeight: FontWeight.w700,
        fontSize: 35.sp(context),
        color: AppColors.black29,
      ),
      cursorHeight: 35.h(context),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white253,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.orange125, width: 1),
          borderRadius: BorderRadius.circular(8.r(context)),
        ) ,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.r(context)),
        ),
        constraints: BoxConstraints(
          maxHeight: 64.h(context),
          maxWidth: 54.w(context),
        ),
        hintText: "0",
        hintStyle: GoogleFonts.urbanist(
          fontWeight: FontWeight.w400,
          fontSize: 35.sp(context),
          color: AppColors.black114,
        ),
      ),
    );
  }




}