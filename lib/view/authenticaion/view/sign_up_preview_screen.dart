

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/view.dart';

class SignUpPreviewScreen extends StatelessWidget {
  const SignUpPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 2), () {
    //   return Get.to(()=> SignInScreen());
    // },);
    return Scaffold(
      body: SignUpPreviewScreenWidget().signUpPreviewScreenWidget(context: context),
    );
  }
}
