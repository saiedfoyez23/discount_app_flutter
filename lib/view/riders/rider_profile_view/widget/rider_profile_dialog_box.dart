import 'dart:io';

import 'package:discount_me_app/view/riders/rider_profile_view/controller/rider_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RiderProfileDialogBox {

  void imageUpdateDialogBox({
    required BuildContext context,
    required RiderProfileController riderProfileController,
    required String name,
    required String riderId,
  }) {
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
                    // Handle the picked image (e.g., update profile)
                    print('Image selected: ${pickedFile.path}');
                    Get.back();
                    await riderProfileController.updateRiderImageNameController(
                      context: context,
                      riderId: riderId,
                      name: name,
                      pickedImage: File(pickedFile.path),
                    );
                  } else {
                    // Show a SnackBar if no image is selected before popping the dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('No image selected'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                  Get.back(); // Now safely pop the dialog after showing the SnackBar
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
                    print('Image selected: ${pickedFile.path}');
                    Get.back();
                    await riderProfileController.updateRiderImageNameController(
                      context: context,
                      riderId: riderId,
                      name: name,
                      pickedImage: File(pickedFile.path),
                    );
                  } else {
                    // Show a SnackBar if no image is selected before popping the dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('No image selected'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                  Get.back(); // Now safely pop the dialog after showing the SnackBar
                },
              ),
            ],
          ),
        );
      },
    );
  }


  void nameUpdateDialogBox({
    required BuildContext context,
    required RiderProfileController riderProfileController,
    required String name,
    required TextEditingController nameControllerText,
    required String riderId,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text('Change Name'),
        content: TextField(
          controller: nameControllerText,
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
            onPressed: () async {
              Get.back();
              await riderProfileController.updateRiderImageNameController(
                context: context,
                riderId: riderId,
                name: nameControllerText.text,
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