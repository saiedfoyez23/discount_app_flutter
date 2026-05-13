import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';

class ButtonHelperWidget {

  static Widget customButtonWidgetAdventPro({
    required BuildContext context,
    required VoidCallback onPressed,
    required String text,
    double? height,
    Color? backgroundColor,
    Color? textColor,
    Alignment? alignment,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? fontSize,
    FontWeight? fontWeight,
    bool isFullWidth = false,
    Widget? icon,
  }) {
    return Container(
      height: height?.h(context) ?? 56.h(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular((borderRadius ?? 10).r(context)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(
            vertical: 14.5.vpm(context),
            horizontal: 14.5.hpm(context),
          ),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: TextHelperClass.headingTextWithoutWidthAdventPro(
          context: context,
          alignment: alignment ?? Alignment.center,
          fontSize: fontSize ?? 18,
          fontWeight: fontWeight ?? FontWeight.w700,
          textColor: textColor ?? Colors.transparent,
          text: text,
        ),
      ),
    );
  }



  static Widget customButtonWidget({
    required BuildContext context,
    required VoidCallback onPressed,
    required String text,
    double? height,
    Color? backgroundColor,
    Color? textColor,
    Alignment? alignment,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? fontSize,
    FontWeight? fontWeight,
    bool isFullWidth = false,
    Widget? icon,
  }) {
    return Container(
      height: height?.h(context) ?? 56.h(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular((borderRadius ?? 10).r(context)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(
            vertical: 14.5.vpm(context),
            horizontal: 14.5.hpm(context),
          ),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: TextHelperClass.headingTextWithoutWidth(
          context: context,
          alignment: alignment ?? Alignment.center,
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.w700,
          textColor: textColor ?? Colors.transparent,
          text: text,
        ),
      ),
    );
  }


  static Widget customIconButtonWidgetAdventPro({
    required BuildContext context,
    required VoidCallback? onPressed,
    required String iconPath,
    required String text,
    Widget? textWidget,
    bool isLeading = true,
    bool isIcon = true,
    double height = 56,
    double borderRadius = 10,
    Color? borderColor,
    double? borderWidth,
    Color textColor = ColorUtils.black61,
    double? textSize,
    FontWeight fontWeight = FontWeight.w700,
    double iconSize = 24,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      height: height.h(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(
            vertical: 14.5.vpm(context),
            horizontal: 14.5.hpm(context),
          ),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            if(isLeading == true)...[
              isIcon == true ? ImageHelperWidget.assetImageWidget(
                context: context,
                height: iconSize.h(context),
                width: iconSize.w(context),
                imageString: iconPath,
              ) : SizedBox.shrink(),

              isIcon == true ? SpaceHelperWidget.h(10.w(context)) : SizedBox.shrink(),
            ],


            textWidget ?? TextHelperClass.headingTextWithoutWidthAdventPro(
              context: context,
              alignment: Alignment.centerLeft,
              fontSize: textSize ?? 18,
              fontWeight: fontWeight,
              textColor: textColor,
              text: text,
            ),


            if(isLeading == false)...[

              isIcon == true ? SpaceHelperWidget.h(10.w(context)) : SizedBox.shrink(),

              isIcon == true ? ImageHelperWidget.assetImageWidget(
                context: context,
                height: iconSize.h(context),
                width: iconSize.w(context),
                imageString: iconPath,
              ) : SizedBox.shrink(),

            ],
          ],
        ),
      ),
    );
  }



  static Widget customIconButtonWidget({
    required BuildContext context,
    required VoidCallback onPressed,
    String? iconPath,
    IconData? iconData,
    String? text,
    Widget? textWidget,
    bool isIcon = true,
    bool isIconLeft = true,
    double height = 56,
    double borderRadius = 10,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    Color? borderColor,
    double borderWidth = 0,
    Color textColor = ColorUtils.black61,
    double textSize = 18,
    FontWeight fontWeight = FontWeight.w700,
    double iconSize = 24,
    Color iconColor = Colors.white,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    double spacing = 10,
  }) {

    /// ✅ ICON / IMAGE WIDGET
    Widget iconWidget = const SizedBox.shrink();

    if (isIcon) {
      if (iconData != null) {
        iconWidget = Icon(
          iconData,
          size: iconSize.r(context),
          color: iconColor,
        );
      } else if (iconPath != null && iconPath.isNotEmpty) {
        iconWidget = ImageHelperWidget.assetImageWidget(
          context: context,
          height: iconSize,
          width: iconSize,
          imageString: iconPath,
        );
      }
    }

    /// ✅ TEXT WIDGET
    Widget titleWidget = textWidget ?? TextHelperClass.headingTextWithoutWidth(
      context: context,
      alignment: Alignment.centerLeft,
      fontSize: textSize,
      fontWeight: fontWeight,
      textColor: textColor,
      text: text ?? "",
    );

    return Container(
      height: height.h(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius.r(context),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(
            vertical: 14.5.vpm(context),
            horizontal: 14.5.hpm(context),
          ),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius.r(context),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            /// ✅ LEFT ICON
            if (isIcon && isIconLeft) ...[
              iconWidget,
              SpaceHelperWidget.h(
                spacing.w(context),
              ),
            ],
            /// ✅ TEXT
            Expanded(
              child: titleWidget,
            ),
            /// ✅ RIGHT ICON
            if (isIcon && !isIconLeft) ...[
              SpaceHelperWidget.h(
                spacing.w(context),
              ),
              iconWidget,
            ],
          ],
        ),
      ),
    );
  }


}