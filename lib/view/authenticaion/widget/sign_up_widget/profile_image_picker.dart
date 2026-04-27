import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ProfileImagePicker {


  Widget profileImagePicker({
    required BuildContext context,
    required String selectedRole,
    required SignUpController signUpController,
  }) {
    final bool isVisible = selectedRole == "User" || selectedRole == "Rider" || selectedRole == "Broker";

    return Obx(()=>AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
      height: isVisible ? 160.h(context) : 0.h(context),
      width: 428.w(context),
      child: Visibility(
        visible: isVisible,
        child: Center(
          child: Stack(
            children: [


              SizedBox(
                width: 170.w(context),
                height: 170.h(context),
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    // Profile Picture
                    ImageHelperWidget.circleImageHelperWidget(
                      width: 150.w(context),
                      height: 150.h(context),
                      verticalPadding: 2.vpm(context),
                      horizontalPadding: 2.vpm(context),
                      backgroundColor: ColorUtils.green176,
                      radius: 75.r(context),
                      imageFile: signUpController.imageFile.value.path != "" ? signUpController.imageFile.value.path :  null,
                      imageAsset: signUpController.imageFile.value.path != "" ? null : ImageUtils.imagePickerIcon,
                    ),


                    // Edit Icon Button
                    Positioned(
                      bottom: 18.h(context),
                      right: 18.w(context),
                      child: InkWell(
                        onTap: () async {
                          chooseProfilePhotoEditDialogBox(
                            context: context,
                            galleryFunction: () async {
                              await signUpController.pickProfileImage(
                                source: ImageSource.gallery,
                                context: context,
                              );
                            },
                            cameraFunction: () async {
                              await signUpController.pickProfileImage(
                                source: ImageSource.camera,
                                context: context,
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 40.w(context),
                          height: 40.w(context),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: ColorUtils.secondaryColor,
                            size: 28.r(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ));
  }



  void chooseProfilePhotoEditDialogBox({
    required BuildContext context,
    required Function() galleryFunction,
    required Function() cameraFunction,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true, // user must tap a button
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r(context)),
          ),
          child: IntrinsicHeight(
            child: Container(
              width: 428.w(context),
              decoration: BoxDecoration(
                color: ColorUtils.white238,
                borderRadius: BorderRadius.circular(20.r(context)),
              ),
              padding: EdgeInsets.fromLTRB(
                16.lpm(context),
                20.tpm(context),
                16.rpm(context),
                20.bpm(context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// ===== Title Text =====

                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.center,
                    textAlign: TextAlign.center,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    textColor: ColorUtils.black64,
                    text: "Select Profile Image",
                  ),


                  SpaceHelperWidget.v(32.h(context)),


                  ButtonHelperWidget.customButtonWidget(
                    context: context,
                    onPressed: galleryFunction,
                    text: "Choose Gallery",
                    borderRadius: 16,
                    backgroundColor: ColorUtils.white255,
                    fontWeight: FontWeight.w600,
                    textColor: ColorUtils.black48,
                  ),


                  SpaceHelperWidget.v(10.h(context)),


                  ButtonHelperWidget.customButtonWidget(
                    context: context,
                    onPressed: cameraFunction,
                    text: "Choose Camera",
                    borderRadius: 16,
                    backgroundColor: ColorUtils.white255,
                    fontWeight: FontWeight.w600,
                    textColor: ColorUtils.black48,
                  ),


                ],
              ),
            ),
          ),
        );
      },
    );
  }

}

