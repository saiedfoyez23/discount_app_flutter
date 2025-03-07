// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/picker_dialog.dart';
import 'package:discount_me_app/res/custom_style/custom_size.dart';

class CustomDottedWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Color dottedColor;
  final Color buttonColor;
  final Color textColor;
  CustomDottedWidget({
    super.key,
    this.onTap,
    this.dottedColor=Colors.black,
    this.buttonColor=Colors.black,
    this.textColor=Colors.black
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        DottedBorder(
          color: dottedColor,
          // Dotted border color
          strokeWidth: 1,
          dashPattern: const [6, 3],
          // Length of dashes and gaps
          borderType: BorderType.RRect,
          // Rounded rectangular border
          radius: Radius.circular(6.r),
          // Border radius
          child: Container(
            width: width,
            height: 150,
            decoration: BoxDecoration(
              color: Colors
                  .transparent, // Background color inside dotted border
            ),
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: 32,
                  color: buttonColor,
                ),
                10.heightBox,
                CustomText(
                  title: "Upload",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
