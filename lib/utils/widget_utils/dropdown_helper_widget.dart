import 'package:discount_me_app/res/common_widget/custom_text_container.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownHelperClass<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String hintText;
  final double? width;
  final bool showDropdownIcon;
  final String Function(T)? itemToString;
  final Widget Function(T)? itemBuilder;
  final EdgeInsetsGeometry? contentPadding;
  final double iconSize;
  final Color iconColor;
  final TextStyle? hintStyle;
  final TextStyle? itemStyle;
  final TextStyle? selectedItemStyle;
  final Color fillColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;

  const CustomDropdownHelperClass({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText = "Select",
    this.width,
    this.showDropdownIcon = true,
    this.itemToString,
    this.itemBuilder,
    this.contentPadding,
    this.iconSize = 20,
    this.iconColor = Colors.black,
    this.hintStyle,
    this.itemStyle,
    this.selectedItemStyle,
    this.fillColor = ColorUtils.white253,
    this.borderColor = Colors.transparent,
    this.borderRadius = 10,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField<T>(
        value: value,
        icon: showDropdownIcon ? Icon(
          Icons.keyboard_arrow_down_outlined,
          size: iconSize.r(context),
          color: iconColor,
        ) : null,
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: contentPadding ??  EdgeInsets.symmetric(
            horizontal: 20.hpm(context),
            vertical: 13.vpm(context),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: GoogleFonts.urbanist(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 20.sp(context),
            color: ColorUtils.black114,
          ),
        ),
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: itemBuilder != null ? itemBuilder!(item) : CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
              plainTextStringColor: ColorUtils.black29,
              plainTextStringFontWeight: FontWeight.w700,
              plainTextContainerAlignment: Alignment.centerLeft,
              plainTextString: itemToString != null ? itemToString!(item) : item.toString(),
              plainTextStringFontSize: 20.sp(context),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        style: selectedItemStyle ?? GoogleFonts.urbanist(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp(context),
          color: ColorUtils.black29,
        )
      ),
    );
  }
}