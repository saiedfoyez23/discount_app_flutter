// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';

class VendorHomeAppbarWidget extends StatelessWidget {
  const VendorHomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.menu, color: Colors.black, size: 32.w.h),
              ),
              20.widthBox,
              const Icon(Icons.location_on, size: 16,),
              5.widthBox,
              CustomText(
                title: "Block B Phase 2 Johar Town",
                color: AppColors.blackColor,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              )
            ],
          ),
        ),

        Icon(Icons.notifications, color: AppColors.primaryColor, size: 32.sp,),
      ],
    );
  }
}
