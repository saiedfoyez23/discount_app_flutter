

import 'package:discount_me_app/res/res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackBar {

  void successCustomSnackBar({required BuildContext context, required message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${message}",
          textAlign: TextAlign.center,
          style: GoogleFonts.urbanist(
            fontSize: 20.sp(context),
            fontStyle: FontStyle.normal,
            color: AppColors.white253,
            fontWeight: FontWeight.w600,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.green106,// Makes it floating
        margin: EdgeInsets.only(
          bottom: 50.bpm(context), // Adjust position
          left: 20.lpm(context),
          right: 20.rpm(context),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r(context)), // Rounded corners
        ),
        duration: Duration(seconds: 1),
        dismissDirection: DismissDirection.startToEnd,// Auto-dismiss after 3 seconds
      ),
    );
  }

  void errorCustomSnackBar({required BuildContext context, required message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${message}",
          textAlign: TextAlign.center,
          style: GoogleFonts.urbanist(
            fontSize: 20.sp(context),
            fontStyle: FontStyle.normal,
            color: AppColors.white253,
            fontWeight: FontWeight.w600,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.red191,// Makes it floating
        margin: EdgeInsets.only(
          bottom: 50.bpm(context), // Adjust position
          left: 20.lpm(context),
          right: 20.rpm(context),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r(context)), // Rounded corners
        ),
        duration: Duration(seconds: 1),
        dismissDirection: DismissDirection.startToEnd,// Auto-dismiss after 3 seconds
      ),
    );
  }

}