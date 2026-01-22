import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:discount_me_app/utils/utils.dart';

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
    Color fillColor = ColorUtils.white243,
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
        color: ColorUtils.black48,
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
          fontWeight: FontWeight.w500,
          fontSize: fontSize.sp(context),
          color: ColorUtils.black89,
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
    Color fillColor = ColorUtils.white243,
    double borderRadius = 10,
    double fontSize = 18,
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
        color: ColorUtils.black48,
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
          fontWeight: FontWeight.w500,
          fontSize: fontSize.sp(context),
          color: ColorUtils.black89,
        ),
      ),
    );
  }



}