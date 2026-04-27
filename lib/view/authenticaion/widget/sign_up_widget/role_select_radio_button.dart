import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:get/get.dart';


class RoleSelectRadioButton {

  Widget roleSelectRadioButton({
    required BuildContext context,
    required List<String> roles,
    required SignUpController signUpController,
    required Function(String value) onChanged,
  }) {
    return Container(
      height: 60.h(context),
      width: 428.w(context),
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(()=> Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: roles.map((role) {
              final bool isSelected = signUpController.selectedRole.value == role;

              return Row(
                children: [
                  Radio<String>(
                    value: role,
                    groupValue: signUpController.selectedRole.value,
                    onChanged: (value) {
                      if (value != null) onChanged(value);
                    },
                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                      return isSelected ? ColorUtils.orange41 : ColorUtils.white253;
                    },
                    ),
                  ),


                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: isSelected ? ColorUtils.orange41 : ColorUtils.white253,
                    text: role,
                  ),
                ],
              );
            }).toList(),
          )),
        ),
      ),
    );
  }

}