import 'dart:io';

import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class SignUpScreenWidget {

  final SignUpController signUpController = Get.put(SignUpController());


  Widget signUpScreenWidget({required BuildContext context}) {
    return Obx(()=>Container(
      height: 926.h(context),
      width: 428.w(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.authBg),
          fit: BoxFit.fill,
          opacity: 0.3,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.dstATop),
        ),
      ),
      child: CustomScrollView(
        slivers: [


          CustomAppBarContainer().authScreenAppBar(
            context: context,
            title: "Create Account",
            onPress: () async {
              Get.off(()=>const WelcomeScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
            },
          ),


          SliverToBoxAdapter(
            child: Container(
              width: 428.w(context),
              padding: EdgeInsets.symmetric(
                horizontal: 21.hpm(context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                  AnimatedContainer(
                    duration: Duration(seconds: 5),
                    width: 428.w(context),
                    curve: Curves.easeIn,
                    child:Obx(() => Visibility(
                      visible: signUpController.selectedRole.value == "User" || signUpController.selectedRole.value == "Rider",
                      child: Center(
                        child: Stack(
                          children: [
                            signUpController.imageFile.value.path == "" ? CustomImageContainer.assetImageContainer(
                                height: 100.h(context),
                                width: 100.w(context),
                                assetImage: AppImages.imagePickerIcon,
                                boxFit: BoxFit.fitWidth,
                                boxShape: BoxShape.circle,
                                borderColors: AppColors.green176,
                                borderWidth: 1
                            ) :
                            CustomImageContainer.fileImageContainer(
                                height: 100.h(context),
                                width: 100.w(context),
                                file: signUpController.imageFile.value,
                                boxFit: BoxFit.fitWidth,
                                boxShape: BoxShape.circle,
                                borderColors: AppColors.green176,
                                borderWidth: 1
                            ) ,
                            Positioned(
                              bottom: 0.h(context),
                              right: 0.w(context),
                              child: TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Select Profile Image'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              leading: Icon(Icons.photo_library),
                                              title: Text('Gallery'),
                                              onTap: () async {
                                                final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                                                if (pickedFile != null) {
                                                  print('Image selected: ${pickedFile.path}');
                                                  signUpController.imageFile.value = File(pickedFile.path);
                                                } else {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('No image selected'),
                                                      duration: Duration(seconds: 2),
                                                    ),
                                                  );
                                                }
                                                Navigator.of(context).pop(); // Now safely pop the dialog after showing the SnackBar
                                              },
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.camera_alt),
                                              title: Text('Camera'),
                                              onTap: () async {
                                                final pickedFile = await ImagePicker().pickImage(
                                                    source: ImageSource.camera);
                                                if (pickedFile != null) {
                                                  // Handle the picked image (e.g., update profile)
                                                  signUpController.imageFile.value = File(pickedFile.path);
                                                  print('Image selected: ${pickedFile.path}');
                                                } else {
                                                  // Show a SnackBar if no image is selected before popping the dialog
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('No image selected'),
                                                      duration: Duration(seconds: 2),
                                                    ),
                                                  );
                                                }
                                                Navigator.of(context).pop(); // Now safely pop the dialog after showing the SnackBar
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: 40.h(context),
                                  height: 40.w(context),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                  ),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.secondaryColor,
                                    size: 28,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),),
                  ),


                ],
              ),
            ),
          ),



        ],
      ),
    ));
  }



}