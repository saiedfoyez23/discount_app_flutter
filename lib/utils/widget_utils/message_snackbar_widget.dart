import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageSnackBarWidget {

  static void successSnackBarWidget({
    required BuildContext context,
    required String message,
  }) {
    Get.showSnackbar(
        GetSnackBar(
          duration: Duration(seconds: 1),
          dismissDirection: DismissDirection.startToEnd,
          margin: EdgeInsets.only(
            bottom: 15.bpm(context),
            left: 15.lpm(context),
            right: 15.rpm(context),
          ),
          message: message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorUtils.green139,
          padding: EdgeInsets.only(
            left: 15.lpm(context),
            right: 15.rpm(context),
            top: 20.tpm(context),
            bottom: 20.bpm(context),
          ),
          borderRadius: 10.r(context),
          messageText: Text(
            message,
            style: GoogleFonts.urbanist(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp(context),
              color: ColorUtils.white255,
            ),
          ),
        )
    );
  }


  static void errorSnackBarWidget({
    required BuildContext context,
    required String message,
  }) {
    Get.showSnackbar(
        GetSnackBar(
          duration: Duration(seconds: 1),
          dismissDirection: DismissDirection.startToEnd,
          margin: EdgeInsets.only(
            bottom: 15.bpm(context),
            left: 15.lpm(context),
            right: 15.rpm(context),
          ),
          message: message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorUtils.red191,
          padding: EdgeInsets.only(
            left: 15.lpm(context),
            right: 15.rpm(context),
            top: 20.tpm(context),
            bottom: 20.bpm(context),
          ),
          borderRadius: 10.r(context),
          messageText: Text(
            message,
            style: GoogleFonts.urbanist(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp(context),
              color: ColorUtils.white255,
            ),
          ),
        )
    );
  }



}