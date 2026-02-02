import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/vendors/vendor_profile_view/controller/vendor_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorAccountDeleteDialogBox {

  void vendorAccountDeleteDialogBox({
    required BuildContext context,
    required VendorSettingController vendorSettingController,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Delete Account",
      transitionDuration: Duration(milliseconds: 300), // Animation duration
      pageBuilder: (context, animation, secondaryAnimation) {
        return Obx(()=>Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.red, size: 40),
                SizedBox(height: 20),
                Text(
                  "Delete Account",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    decoration: TextDecoration.none,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Are you sure you want to delete your account? This action cannot be undone.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    decoration: TextDecoration.none,
                    fontFamily: 'Montserrat',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),



                    vendorSettingController.isSubmit.value == true ?
                    Container(
                      height: 64.h(context),
                      width: 64.h(context),
                      decoration: const BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(color: ColorUtils.green176,),
                      ),
                    ) :
                    ElevatedButton(
                      onPressed: () async {
                        await vendorSettingController.deleteRiderProfileController(
                          context: context,
                          riderId: vendorSettingController.vendorProfileResponseModel.value.data?.sId,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedValue = Curves.easeInOut.transform(animation.value) - 1;
        return Transform.translate(
          offset: Offset(0, curvedValue * -50),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
    );
  }





}