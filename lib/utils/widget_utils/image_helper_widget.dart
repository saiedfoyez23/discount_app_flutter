import 'dart:io';

import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';

class ImageHelperWidget {


  static Widget assetImageWidget({
    required BuildContext context,
    required double height,
    required double width,
    required String imageString,
    BoxFit fit = BoxFit.cover,
  }) {
    return SizedBox(
      height: height.h(context),
      width: width.w(context),
      child: FittedBox(
        fit: fit,
        child: Image.asset(
          imageString,
        ),
      ),
    );
  }


  static Widget styledImage({
    required BuildContext context,
    required double height,
    required double width,
    BoxFit fit = BoxFit.cover,
    double borderRadius = 10,
    double? topLeftRadius,
    double? topRightRadius,
    double? bottomLeftRadius,
    double? bottomRightRadius,
    String? imageAsset,
    String? imageUrl,
    String? imageFile,
    Widget? errorWidget,
  }) {
    ImageProvider? provider;

    if (imageFile != null && imageFile.isNotEmpty) {
      provider = FileImage(File(imageFile));
    } else if (imageUrl != null && imageUrl.isNotEmpty) {
      provider = NetworkImage(imageUrl);
    } else if (imageAsset != null && imageAsset.isNotEmpty) {
      provider = AssetImage(imageAsset);
    }

    final border = BorderRadius.only(
      topLeft: Radius.circular((topLeftRadius ?? borderRadius).r(context)),
      topRight: Radius.circular((topRightRadius ?? borderRadius).r(context)),
      bottomLeft: Radius.circular((bottomLeftRadius ?? borderRadius).r(context)),
      bottomRight: Radius.circular((bottomRightRadius ?? borderRadius).r(context)),
    );
    

    return SizedBox(
      height: height.h(context),
      width: width.w(context),
      child: ClipRRect(
        borderRadius: border,
        child: provider != null ? Image(
          image: provider,
          fit: fit,
          height: height.h(context),
          width: width.w(context),
          errorBuilder: (context, error, stackTrace) {
            return errorWidget ?? Icon(
              Icons.broken_image, 
              color: ColorUtils.white221,
              size: 40.r(context),
            );
          },
        ) : SizedBox.shrink(),
      ),
    );
  }


  static Widget circleImageHelperWidget({
    required BuildContext context,
    double? width,
    double? height,
    double size = 150,
    double radius = 75,
    double padding = 0,
    double? verticalPadding,
    double? horizontalPadding,
    Color backgroundColor = ColorUtils.orange213,
    ImageProvider? image,
    String? imageAsset,
    String? imageUrl,
    String? imageFile, // New parameter for file path
    Widget? placeholder,
    Widget? errorWidget,
    BoxFit fit = BoxFit.cover,
    bool showBorder = false,
    Color borderColor = Colors.transparent,
    double borderWidth = 2.0,
    List<BoxShadow>? shadow,
    Alignment imageAlignment = Alignment.center,
    BorderRadius? borderRadius, // New parameter for optional border radius
  }) {
    final effectiveWidth = width ?? size;
    final effectiveHeight = height ?? size;
    final effectiveVerticalPadding = verticalPadding ?? padding;
    final effectiveHorizontalPadding = horizontalPadding ?? padding;

    ImageProvider? getImageProvider() {
      if (image != null) return image;
      if (imageAsset != null && imageAsset.isNotEmpty) {
        return AssetImage(imageAsset);
      }
      if (imageUrl != null && imageUrl.isNotEmpty) {
        return NetworkImage(imageUrl);
      }
      if (imageFile != null && imageFile.isNotEmpty) {
        return FileImage(File(imageFile)); // Add import 'dart:io' at the top
      }
      return null;
    }

    Widget buildPlaceholder() {
      if (errorWidget != null) return errorWidget;
      if (placeholder != null) return placeholder;

      return Icon(
        Icons.person_outline,
        size: radius * 0.8,
        color: Colors.white54,
      );
    }

    // Determine the shape and borderRadius
    final bool isCircle = borderRadius == null;
    final BoxShape containerShape = isCircle ? BoxShape.circle : BoxShape.rectangle;
    Widget imageWidget;


    imageWidget = CircleAvatar(
      radius: radius,
      backgroundImage: getImageProvider(),
      backgroundColor: Colors.transparent,
      onBackgroundImageError: (exception, stackTrace) {
        debugPrint('Image load error: $exception');
      },
      child: getImageProvider() == null ? buildPlaceholder() : null,
    );


    return Container(
      width: effectiveWidth.w(context),
      height: effectiveHeight.h(context),
      padding: EdgeInsets.symmetric(
        vertical: effectiveVerticalPadding.vpm(context),
        horizontal: effectiveHorizontalPadding.hpm(context),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: containerShape,
        borderRadius: isCircle ? null : borderRadius , // Only used when shape is rectangle
        border: showBorder ? Border.all(
          color: borderColor,
          width: borderWidth,
        ) : null,
        boxShadow: shadow,
      ),
      child: imageWidget,
    );
  }

}