// ignore_for_file: prefer_const_constructor

import '../app_const/import_list.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget {
  final String appBarName;
  final Color titleColor;
  final Color leadingColor;
  final VoidCallback? onTap;
  const CustomAppBar({super.key,
    required this.appBarName,
    this.titleColor=Colors.white,
    this.onTap,
    this.leadingColor=Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(Icons.arrow_back, color: leadingColor, size: 24),
        ),
        Expanded(
          child: Center(
            child: CustomText(
              title: appBarName,
              color: titleColor,
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}
