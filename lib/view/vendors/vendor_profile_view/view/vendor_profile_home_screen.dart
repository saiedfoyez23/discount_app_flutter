import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/vendors/vendor_coupon_management/view/vendor_created_coupon_screen.dart';
import 'package:discount_me_app/view/vendors/vendor_suppor_chat_view/view/vendor_chat_user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:get/get.dart';

class VendorProfileHomeScreen extends StatefulWidget {
  const VendorProfileHomeScreen({super.key});

  @override
  State<VendorProfileHomeScreen> createState() => _VendorProfileHomeScreenState();
}

class _VendorProfileHomeScreenState extends State<VendorProfileHomeScreen> {
  String username = 'Foods King Resturant';
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(
          title: "Profile",
          color: ColorUtils.blackColor,
          fontSize: 24.sp(context),
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: ColorUtils.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile image
              20.heightBox,
              Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        ImageUtils.homeResProImg,
                        fit: BoxFit.cover,
                        width: 202.w(context),
                        height: 202.h(context),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 17,
                      child: GestureDetector(
                        onTap: () {
                          PickerDialog().showImagePickerDialog(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 34.w(context),
                          height: 34.h(context),
                          decoration: BoxDecoration(
                            color: ColorUtils.secondaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: ColorUtils.whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // name section
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    title: "$username",
                    fontSize: 18.sp(context),
                    fontWeight: FontWeight.w700,
                    color: ColorUtils.blackColor,
                  ),
                  10.widthBox,
                  GestureDetector(
                    onTap: () => showNameChangeDialog(context),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18.sp(context),
                      )
                    ),
                  )
                ],
              ),

              40.heightBox,
              CustomProfileItemWidget(
                title: "Edit Profile",
                icon: Image.asset(
                  ImageUtils.userEdite,
                  scale: 4,
                ),
                navigateIcon: Icon(Icons.navigate_next),
                onTap: () {
                  Get.to(()=>VendorProfileEditScreen());
                },
              ),
              Divider(),
              5.heightBox,
              CustomProfileItemWidget(
                title: "Earnings",
                icon: Image.asset(
                  ImageUtils.earnIcon,
                  scale: 4,
                ),
                navigateIcon: Icon(Icons.navigate_next),
                onTap: () {
                  Get.to(VendorEaringHomeScreen());
                },
              ),
              Divider(),

              5.heightBox,
              CustomProfileItemWidget(
                title: "Coupon Management ",
                icon: Image.asset(
                  ImageUtils.couponManagementIcon,
                  scale: 4,
                ),
                navigateIcon: Icon(Icons.navigate_next),
                onTap: () {
                  Get.to(()=>VendorCreatedCouponScreen());
                },
              ),
              Divider(),
              5.heightBox,
              CustomProfileItemWidget(
                title: "Support Chat",
                icon: Image.asset(ImageUtils.chat, scale: 4,),
                navigateIcon: Icon(Icons.navigate_next),
                onTap: () {
                  Get.to(()=>VendorChatUserListScreen());
                },
              ),

              Divider(),
              5.heightBox,
              CustomProfileItemWidget(
                title: "Settings",
                icon: Image.asset(ImageUtils.settingIcon, scale: 4,),
                navigateIcon: Icon(Icons.navigate_next),
                onTap: () {
                  Get.to(()=>VendorSettingScreen());
                },
              ),
              Divider(),
              5.heightBox,
              CustomProfileItemWidget(
                title: "Logout",
                icon: Image.asset(
                  ImageUtils.userEdite,
                  scale: 4,
                ),
                onTap: () {
                  CustomAlertDialog().customAlert(
                    context: context, title: 'Logout',
                    message: 'Are you sure you want to logout?',
                    NegativebuttonText: 'Cancel',
                    PositivvebuttonText: 'Logout',
                    onPositiveButtonPressed: () {
                      Navigator.of(context).pop();
                      Get.to(()=>SignInScreen());
                    },
                    onNegativeButtonPressed: () => Navigator.of(context).pop(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // Function to show name change dialog
  void showNameChangeDialog(BuildContext context) {
    nameController.text = username;
    Get.dialog(
      AlertDialog(
        title: Text('Change Name'),
        content: TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: "Enter your name",
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                username = nameController.text;
              });
              Get.back();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
