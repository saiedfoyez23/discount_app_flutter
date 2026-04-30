import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/countries.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_intl_phone_field/phone_number.dart';
import 'package:pinput/pinput.dart';

class TextFormFieldWidget {

  static Widget build({
    required BuildContext context,
    String? hintText,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    bool readOnly = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color? borderColor,
    Color? enableBorderColor,
    Color? focusedBorderColor,
    Color fillColor = ColorUtils.white253,
    double borderRadius = 10,
    double fontSize = 18,
    EdgeInsetsGeometry? contentPadding,
    void Function(String?)? onChanged,
    void Function(String?)? onSaved,
    void Function()? onTap,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      obscuringCharacter: "*",
      style: GoogleFonts.urbanist(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: fontSize.sp(context),
        color: ColorUtils.black29,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(
          horizontal: 20.hpm(context),
          vertical: 13.vpm(context),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(color: enableBorderColor ?? Colors.transparent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(color: focusedBorderColor ?? Colors.transparent, width: 1),
        ),
        filled: true,
        fillColor: fillColor,
        hintStyle: GoogleFonts.urbanist(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: fontSize.sp(context),
          color: ColorUtils.black114,
        ),
      ),
    );
  }


  static Widget buildIntlPhoneField({
    required BuildContext context,
    String? hintText,
    String? labelText,
    required Key key,
    TextEditingController? controller,
    bool disableLengthCheck = true,
    String initialCountryCode = 'IN',
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color? borderColor,
    Color? enableBorderColor,
    Color? focusedBorderColor,
    Color fillColor = ColorUtils.white253,
    double borderRadius = 10,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsetsGeometry? contentPadding,
    void Function(PhoneNumber)? onChanged,
    void Function(Country)? onCountryChanged,
  }) {
    return SizedBox(
      width: 428.w(context),
      child: IntlPhoneField(
        key: key,
        controller: controller,
        disableLengthCheck: disableLengthCheck,
        initialCountryCode: initialCountryCode,
        onChanged: onChanged,
        onCountryChanged: onCountryChanged,
        style: GoogleFonts.urbanist(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: fontSize.sp(context),
          color: ColorUtils.black29,
        ),
        maxLength: 20,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: contentPadding ?? EdgeInsets.symmetric(
            horizontal: 20.hpm(context),
            vertical: 13.vpm(context),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: enableBorderColor ?? Colors.transparent, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: focusedBorderColor ?? Colors.transparent, width: 1),
          ),
          filled: true,
          fillColor: fillColor,
          hintStyle: GoogleFonts.urbanist(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: fontSize.sp(context),
            color: ColorUtils.black114,
          ),
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
        fontSize: 18.sp(context),
        color: ColorUtils.white253,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.vpm(context),
        ),
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: GoogleFonts.urbanist(
          fontWeight: FontWeight.w600,
          fontSize: 18.sp(context),
          color: ColorUtils.white253,
        ),
      ),
    );
  }


  static Widget textFiledWithMaxLineBuild({
    required BuildContext context,
    String? hintText,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool readOnly = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color? borderColor,
    Color? enableBorderColor,
    Color? focusedBorderColor,
    Color fillColor = ColorUtils.white253,
    double borderRadius = 10,
    double fontSize = 20,
    int? maxLines = 1,
    int? minLines,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsetsGeometry? contentPadding,
    void Function(String?)? onChanged,
    void Function(String?)? onSaved,
    void Function()? onTap,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: minLines,
      onSaved: onSaved,
      onTap: onTap,
      style: GoogleFonts.urbanist(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: fontSize.sp(context),
        color: ColorUtils.black29,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(
          horizontal: 20.hpm(context),
          vertical: 13.vpm(context),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(color: enableBorderColor ?? Colors.transparent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(color: focusedBorderColor ?? Colors.transparent, width: 1),
        ),
        filled: true,
        fillColor: fillColor,
        hintStyle: GoogleFonts.urbanist(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: fontSize.sp(context),
          color: ColorUtils.black114,
        ),
      ),
    );
  }


  static Widget otpInputFiledBuild({
    required BuildContext context,
    required ValueChanged<String> onCompleted,
    required TextEditingController pinController,
    int length = 6,
    bool showCursor = true,
    bool obscureText = false,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,

    // Sizing
    double width = 48,
    double height = 60,

    // Text Style
    double fontSize = 24,
    Color textColor = ColorUtils.black89,
    FontWeight fontWeight = FontWeight.w500,

    // Box Decoration
    Color backgroundColor = ColorUtils.white253,
    double borderRadius = 8,

    // Focused State
    Color focusedBorderColor = ColorUtils.orange213,
    double focusedBorderWidth = 1,

    // Submitted State
    Color submittedBorderColor = Colors.transparent,
  }) {
    final defaultPinTheme = PinTheme(
      width: width.w(context),
      height: height.h(context),
      textStyle: GoogleFonts.poppins(
        fontSize: fontSize.sp(context),
        color: textColor,
        fontWeight: fontWeight,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
        border: Border.all(color: Colors.transparent),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
        border: Border.all(
          color: focusedBorderColor,
          width: focusedBorderWidth,
        ),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
        border: Border.all(color: submittedBorderColor),
      ),
    );

    return Pinput(
      controller: pinController,
      length: length,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      showCursor: showCursor,
      obscureText: obscureText,
      onCompleted: onCompleted,
      mainAxisAlignment: mainAxisAlignment,
    );
  }




}