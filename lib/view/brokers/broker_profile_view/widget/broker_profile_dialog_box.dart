import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';

class BrokerProfileDialogBox {


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


  void nameEditDialogBox({
    required BuildContext context,
    required TextEditingController controller,
    String? title,
    String? hintText,
    required Function() cancelFunction,
    required Function() editFunction,
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
                    alignment: Alignment.centerLeft,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    textColor: ColorUtils.black96,
                    text: title ?? "Title",
                  ),

                  SpaceHelperWidget.v(10.h(context)),

                  TextFormFieldWidget.build(
                    context: context,
                    hintText: hintText ?? "Enter title",
                    controller: controller,
                    keyboardType: TextInputType.text,
                  ),


                  SpaceHelperWidget.v(15.h(context)),

                  Row(
                    children: [

                      Expanded(
                        child: ButtonHelperWidget.customButtonWidget(
                          context: context,
                          height: 38,
                          padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 56.hpm(context)),
                          onPressed: cancelFunction,
                          text: "Cancel",
                          borderRadius: 12,
                          fontSize: 15,
                          backgroundColor: ColorUtils.red191,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.white255,
                        ),
                      ),

                      SpaceHelperWidget.h(10.w(context)),

                      Expanded(
                        child: ButtonHelperWidget.customButtonWidget(
                          context: context,
                          height: 38,
                          padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 56.hpm(context)),
                          onPressed: editFunction,
                          text: "Edit",
                          borderRadius: 12,
                          fontSize: 15,
                          backgroundColor: ColorUtils.secondaryColor,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.white255,
                        ),
                      ),


                    ],
                  ),


                ],
              ),
            ),
          ),
        );
      },
    );
  }


  void logOutDialogBox({
    required BuildContext context,
    String? title,
    String? message,
    required Function() cancelFunction,
    required Function() logoutFunction,
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
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    textColor: ColorUtils.black21,
                    text: "Logout",
                  ),

                  SpaceHelperWidget.v(10.h(context)),

                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.center,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    textColor: ColorUtils.black48,
                    text: 'Are you sure you want to logout?',
                  ),




                  SpaceHelperWidget.v(15.h(context)),

                  Row(
                    children: [

                      Expanded(
                        child: ButtonHelperWidget.customButtonWidget(
                          height: 38,
                          padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 56.hpm(context)),
                          context: context,
                          onPressed: cancelFunction,
                          text: "Cancel",
                          borderRadius: 12,
                          fontSize: 15,
                          backgroundColor: ColorUtils.red191,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.white255,
                        ),
                      ),

                      SpaceHelperWidget.h(10.w(context)),

                      Expanded(
                        child: ButtonHelperWidget.customButtonWidget(
                          height: 38,
                          padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 56.hpm(context)),
                          context: context,
                          onPressed: logoutFunction,
                          text: "Logout",
                          borderRadius: 12,
                          fontSize: 15,
                          backgroundColor: ColorUtils.secondaryColor,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.white255,
                        ),
                      ),


                    ],
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