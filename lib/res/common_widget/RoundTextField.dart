// ignore_for_file: prefer_const_constructors


import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/custom_style/custom_style.dart';


class RoundTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color focusColor;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLine;
  final TextAlign textAlign;
  final bool readOnly;
  final TextStyle? style;
  final bool obscureText;
  final String obscuringCharacter;
  final Function(String?)? onSaved;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final bool? filled;
  final Color fillColor;
  final double focusBorderRadius;
  final double focusBorderWidth;


  const RoundTextField({super.key,
    required this.hint,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.focusColor=Colors.orange,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.maxLine,
    this.readOnly=false,
    this.obscureText=false,
    this.textAlign=TextAlign.start,
    this.obscuringCharacter='•',
    this.style,
    this.onSaved,
    this.borderRadius=8,
    this.focusBorderRadius=8,
    this.borderColor= Colors.grey,
    this.borderWidth=0.5,
    this.filled=false,
    this.fillColor=const Color(0xffEDF8F7),
    this.focusBorderWidth=1.5,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusColor, width: focusBorderWidth),
          borderRadius: BorderRadius.circular(focusBorderRadius)
        ),
        hintText: hint,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: borderWidth, color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius)
        ),
      ),
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLength: maxLine,
      textAlign: textAlign,
      readOnly: readOnly,
      style: style,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      onSaved: onSaved,
    );
  }
}
