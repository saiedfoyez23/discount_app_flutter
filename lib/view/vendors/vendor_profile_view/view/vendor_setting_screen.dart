// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/vendors/vendor_profile_view/view/vendor_change_password_screen.dart';

class VendorSettingScreen extends StatefulWidget {
  const VendorSettingScreen({super.key});

  @override
  State<VendorSettingScreen> createState() => _VendorSettingScreenState();
}

class _VendorSettingScreenState extends State<VendorSettingScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(AppImages.homeBg),
            alignment: Alignment.topRight,
            opacity: 0.5),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // appBar
                  10.heightBox,
                  UserProfileAppbarWidget(title: "Setting", onTap: () => Get.back(),),

                  50.heightBox,
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>VendorChangePasswordScreen());
                    },
                    child: changePasswordItem(),
                  ),


                  20.heightBox,
                  GestureDetector(
                    onTap: () {
                      CustomAlertDialog().showDeleteAccountDialog(context);
                    },
                    child: deleteAccountItem(),
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget changePasswordItem(){
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.greenLight,
          borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              Icon(Icons.lock_outline, color: Colors.black,),

              15.widthBox,

              CustomText(title: "Change Password",
                fontSize: 16.sp, fontWeight: FontWeight.w500,
                color: Color(0xff727272),
              )
            ],
          ),

          Icon(Icons.navigate_next, size: 24,)

        ],
      ),
    );
  }
  Widget deleteAccountItem(){
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.greenLight,
          borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        children: [
          Icon(Icons.lock_outline, color: Colors.black,),

          15.widthBox,

          CustomText(title: "Delete Account",
            fontSize: 16.sp, fontWeight: FontWeight.w500,
            color: Color(0xff727272),
          )
        ],
      ),
    );
  }
}
