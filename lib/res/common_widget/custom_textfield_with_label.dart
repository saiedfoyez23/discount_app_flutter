import 'package:discount_me_app/res/app_const/import_list.dart';

class CustomTextfieldWithLabel extends StatelessWidget {
  final VoidCallback? onTap;
  final String labelName;
  final TextEditingController? controller;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Color focusColor;
  final Color labelTextColor;


  const CustomTextfieldWithLabel({
    super.key,
    required this.labelName,
    this.onTap,
    this.controller,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType =TextInputType.text,
    this.focusColor = AppColors.secondaryColor,
    this.labelTextColor = AppColors.whiteColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: labelName,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          color: labelTextColor,
        ),
        const SizedBox(height: 10),
        Material( // Wrap the TextField with Material
          color: Colors.transparent, // Keep it transparent if needed
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focusColor, width: 1),
                borderRadius: BorderRadius.circular(8.r),
              ) ,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.whiteNormalActive, width: 0.5),
                borderRadius: BorderRadius.circular(8.r),
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hint,
              hintStyle: GoogleFonts.urbanist(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
