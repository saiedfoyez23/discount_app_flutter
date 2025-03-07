// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';

class SignUpPreviewScreen extends StatelessWidget {
  const SignUpPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      return Get.to(()=> SignInScreen());
    },);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.authBg),
          fit: BoxFit.fill,
          opacity: 0.3,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Image.asset(AppImages.signUpPreviewImg,scale: 4,),

          CustomText(
              title: "Your application is under review",
            color: AppColors.secondaryColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),

          30.heightBox,

          Container(
            margin: EdgeInsets.symmetric(horizontal: 60.w),
            child: Text(
              textAlign: TextAlign.center,
              "We will notify you as soon as your account has been approved",
              style: GoogleFonts.urbanist(
                color: AppColors.whiteColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none
              ),
            )
          )


        ],
      ),
    );
  }
}
