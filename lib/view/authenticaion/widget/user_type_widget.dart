import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/authenticaion/controller/radio_button_controller.dart';
import 'package:discount_me_app/view/view.dart';

class UserTypeWidget extends StatelessWidget {
  UserTypeWidget({super.key});
  final RadioController radioController = Get.put(RadioController());
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: width,
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // User Radio Button
              Obx(() => Row(
                children: [
                  Radio<String>(
                    value: "User",
                    groupValue: radioController.selectedRole.value,
                    onChanged: (value) async {
                      radioController.changeRole(value!);
                      await signUpController.resetFunction();
                    },
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return radioController.selectedRole.value == "User"
                            ? Color(0xffff7d29)  // Active color
                            : Colors.white;      // Inactive color
                      },
                    ),
                  ),
                  CustomText(
                    title: "User",
                    fontSize: 16.sp,
                    color: radioController.selectedRole.value == "User"
                        ? Color(0xffff7d29)
                        : Colors.white,
                  ),
                ],
              )),

              const SizedBox(width: 20),

              // Rider Radio Button
              Obx(() => Row(
                children: [
                  Radio<String>(
                    value: "Rider",
                    groupValue: radioController.selectedRole.value,
                    onChanged: (value) async {
                      radioController.changeRole(value!);
                      await signUpController.resetFunction();
                    },
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return radioController.selectedRole.value == "Rider"
                            ? Color(0xffff7d29)  // Active color
                            : Colors.white;      // Inactive color
                      },
                    ),
                  ),
                  CustomText(
                    title: "Rider",
                    fontSize: 16.sp,
                    color: radioController.selectedRole.value == "Rider"
                        ? Color(0xffff7d29)
                        : Colors.white,
                  ),
                ],
              )),

              const SizedBox(width: 20),

              // Vendor Radio Button
              Obx(() => Row(
                children: [
                  Radio<String>(
                    value: "Vendor",
                    groupValue: radioController.selectedRole.value,
                    onChanged: (value) async {
                      radioController.changeRole(value!);
                      await signUpController.resetFunction();
                    },
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return radioController.selectedRole.value == "Vendor"
                            ? Color(0xffff7d29)  // Active color
                            : Colors.white;      // Inactive color
                      },
                    ),
                  ),
                  CustomText(
                    title: "Vendor",
                    fontSize: 16.sp,
                    color: radioController.selectedRole.value == "Vendor"
                        ? Color(0xffff7d29)
                        : Colors.white,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
