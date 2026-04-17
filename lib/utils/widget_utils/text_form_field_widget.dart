import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_intl_phone_field/phone_number.dart';

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
  }) {
    return SizedBox(
      width: 428.w(context),
      child: IntlPhoneField(
        controller: controller,
        disableLengthCheck: disableLengthCheck,
        initialCountryCode: initialCountryCode,
        onChanged: onChanged,
        style: GoogleFonts.urbanist(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: fontSize.sp(context),
          color: ColorUtils.black29,
        ),
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



}