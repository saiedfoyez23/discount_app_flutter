// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/picker_dialog.dart';
import 'package:discount_me_app/res/custom_style/custom_size.dart';

class UploadDocumentWidget extends StatelessWidget {
  const UploadDocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: "Upload Tax Document",
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        10.heightBox,
        Stack(
          children: [
            DottedBorder(
              color: AppColors.whiteColor,
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
                onTap: () {
                  PickerDialog().showDocumentPickerDialog(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 32,
                      color: Colors.white,
                    ),
                    5.heightBox,
                    CustomText(
                      title: "Upload",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
