import 'dart:io';

import 'package:discount_me_app/view/vendors/vendor_profile_view/controller/vendor_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorProfileDialogBox {

  void nameUpdateDialogBox({
    required BuildContext context,
    required VendorProfileController vendorProfileController,
    required String name,
    required TextEditingController nameControllerText,
    required String vendorId,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text('Change Store Name'),
        content: TextField(
          controller: nameControllerText,
          decoration: InputDecoration(
            hintText: "Enter Store name",
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
            onPressed: () async {
              Get.back();
              await vendorProfileController.updateVendorImageNameController(
                context: context,
                vendorId: vendorId,
                storeName: nameControllerText.text,
                pickedImage: File(""),
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

}