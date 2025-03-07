import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/view.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({super.key,required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        Get.off(()=>const ForgotPasswordScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: OtpVerifyScreenWidget().otpVerifyScreenWidget(context: context,email: email),
      ),
    );
  }
}
