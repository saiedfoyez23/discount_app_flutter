import 'dart:io';

import 'package:discount_me_app/view/riders/rider_profile_view/controller/rider_profile_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RiderEditProfileDialogBox {

  void riderEditProfileDialogBox({
    required BuildContext context,
    required RiderProfileEditController riderProfileEditController,
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
                    print('Image selected: ${pickedFile.path}');
                    riderProfileEditController.imageFile.value = File(pickedFile.path);
                    riderProfileEditController.image.value = "";
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
                    riderProfileEditController.imageFile.value = File(pickedFile.path);
                    riderProfileEditController.image.value = "";
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
  }




}