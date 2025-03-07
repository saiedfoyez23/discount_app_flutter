// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/custom_style/custom_size.dart';
import 'package:discount_me_app/view/brokers/broker_profile_view/view/broker_edit_profile_screen.dart';

class BrokerProfileHomeScreen extends StatefulWidget {
  const BrokerProfileHomeScreen({super.key});

  @override
  State<BrokerProfileHomeScreen> createState() =>
      _BrokerProfileHomeScreenState();
}

class _BrokerProfileHomeScreenState extends State<BrokerProfileHomeScreen> {
  String username = 'Foods King Resturant';
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(
          title: "Profile",
          color: AppColors.blackColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.white,
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
                        AppImages.homeResProImg,
                        fit: BoxFit.cover,
                        width: 202.w,
                        height: 202.h,
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
                          width: 34.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: AppColors.whiteColor,
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
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                  10.widthBox,
                  GestureDetector(
                    onTap: () =>  showNameChangeDialog(context),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18.sp,
                      )
                    ),
                  )
                ],
              ),


              40.heightBox,
              CustomProfileItemWidget(
                title: "Edit Profile",
                icon: Image.asset(
                  AppImages.userEdite,
                  scale: 4,
                ),
                navigateIcon: Icon(Icons.navigate_next),
                onTap: () {
                  Get.to(BrokerEditProfileScreen());
                },
              ),


              Divider(),
              5.heightBox,
              CustomProfileItemWidget(
                title: "Settings",
                icon: Image.asset(AppImages.settingIcon, scale: 4,),
                navigateIcon: Icon(Icons.navigate_next),
                onTap: () {
                  Get.to(VendorSettingScreen());
                },
              ),
              Divider(),
              5.heightBox,
              CustomProfileItemWidget(
                title: "Logout",
                icon: Image.asset(
                  AppImages.userEdite,
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
