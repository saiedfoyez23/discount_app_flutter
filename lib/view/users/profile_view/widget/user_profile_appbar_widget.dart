// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';

class UserProfileAppbarWidget extends StatelessWidget {
  final String title;
  final Widget? widget;
  final VoidCallback? onTap;
  UserProfileAppbarWidget({super.key, required this.title, this.onTap,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: widget??Icon(Icons.arrow_back, color: Colors.black, size: 28,),
        ),

        Expanded(
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.urbanist(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
            )
        )
      ],
    );
  }
}
