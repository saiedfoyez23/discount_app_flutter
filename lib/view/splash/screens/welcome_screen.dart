import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a duration of 2 seconds
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    // Define the animation range from 0 (left) to 1 (right)
    _animation = Tween<double>(begin: -1, end: 1.5).animate(_controller);

    // Set up the controller to repeat the animation forward and reverse (ping-pong)
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: 926.h(context),
        width: 428.w(context),
        decoration: const BoxDecoration(
          color: AppColors.white253,
        ),
        child: Stack(
          children: [

            Align(
              alignment: Alignment.bottomCenter,
              child: CustomImageContainer.assetImageContainer(
                height: 313.h(context),
                width: 428.w(context),
                assetImage: AppImages.welcomeBgMain,
                boxFit: BoxFit.fitWidth,
              ),
            ),

            Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 21.hpm(context),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      CustomImageContainer.assetImageContainer(
                        height: 93.h(context),
                        width: 428.w(context),
                        assetImage: AppImages.discountMeLogo,
                        boxFit: BoxFit.contain,
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                      CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                        plainTextString: "Let’s get started!",
                        plainTextStringFontSize: 24.sp(context),
                        plainTextStringFontWeight: FontWeight.w700,
                        plainTextContainerAlignment: Alignment.center,
                        plainTextStringColor: AppColors.black29,
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),

                      CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                        plainTextString: "Login to Stay healthy and fit ",
                        plainTextStringFontSize: 18.sp(context),
                        plainTextStringFontWeight: FontWeight.w400,
                        plainTextContainerAlignment: Alignment.center,
                        plainTextStringColor: AppColors.black43,
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                      CustomButtonContainer.plainButtonContainer(
                        plainButtonHeight: 64.h(context),
                        plainButtonWidth: 428.w(context),
                        plainButtonRadius: 8.r(context),
                        plainButtonOnPress:  () async {
                          Get.off(()=> SignInScreen(), duration: const Duration(milliseconds: 100),preventDuplicates: false);
                        },
                        plainButtonHint: "Log in",
                        plainButtonHintFontSize: 22.sp(context),
                        plainButtonColor: AppColors.green176,
                        plainButtonHintFontColor: AppColors.white255,
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                      CustomButtonContainer.plainButtonContainer(
                        plainButtonHeight: 64.h(context),
                        plainButtonWidth: 428.w(context),
                        plainButtonRadius: 8.r(context),
                        plainButtonOnPress:  () async {
                          Get.off(()=> SignUpScreen(), duration: const Duration(milliseconds: 100),preventDuplicates: false);
                        },
                        plainButtonHint: "Sign Up",
                        plainButtonHintFontSize: 22.sp(context),
                        plainButtonBorderColor: AppColors.orange125,
                        plainButtonBorderWidth: 1,
                        plainButtonHintFontColor: AppColors.orange125,
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 15.h(context)),

                      CustomRichTextContainer.plainRichTextContainerWidgetWithoutWidthHeight(
                          context: context,
                          plainPrimaryTextStringAlign: TextAlign.center,
                          plainPrimaryTextString: "If you want to work with us ",
                          plainRichTextStringFontSize: 20.sp(context),
                          plainRichTextStringColor: AppColors.black29,
                          plainRichTextStringFontWeight: FontWeight.w500,
                          textSpanList: [
                            TextSpan(
                              text: "Click Here",
                              style: CustomRichTextContainer.plainRichTextStringStyleWithDecoration(
                                  context: context,
                                  plainRichTextStringFontSize: 20.sp(context),
                                  plainRichTextStringColor:AppColors.orange125,
                                  plainRichTextStringFontWeight: FontWeight.w600
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Get.off(()=>BrokerSignUpScreen(), duration: const Duration(milliseconds: 100),preventDuplicates: false);
                              },
                            ),
                          ]
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 34.h(context)),
                    ],
                  ),
                )
            ),


            //Add the animated motorcycle at the bottom
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                bool isMovingLeft = _controller.status == AnimationStatus.reverse;
                String imagePath = isMovingLeft
                    ? AppImages.discountMeBikeRight // Image for right-to-left
                    : AppImages.discountMeBike; // Image for left-to-right

                return Positioned(
                  bottom: 0,
                  left: _animation.value * (width - 100), // Moves motorcycle left to right and back
                  child: Image.asset(imagePath, scale: 4),
                );
              },
            ),


          ],
        ),
      )
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   var width = MediaQuery.of(context).size.width;
  //   var height = MediaQuery.of(context).size.height;
  //
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: Stack(
  //       children: [
  //         Align(
  //           alignment: Alignment.bottomCenter,
  //           child: Image.asset(
  //             AppImages.welcomeBgMain,
  //             width: width,
  //             fit: BoxFit.fitWidth,
  //           ),
  //         ),
  //         Positioned.fill(
  //           child: Padding(
  //             padding: const EdgeInsets.all(20),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Container(
  //                   width: width,
  //                   margin: const EdgeInsets.symmetric(horizontal: 10),
  //                   child: Image.asset(AppImages.discountMeLogo),
  //                 ),
  //                 const SizedBox(height: 20),
  //                 CustomText(
  //                   title: "Let’s get started!",
  //                   fontWeight: FontWeight.w700,
  //                   fontSize: 24.sp,
  //                   color: const Color(0xff1D242D),
  //                 ),
  //                 const SizedBox(height: 5),
  //                 CustomText(
  //                   title: "Login to Stay healthy and fit ",
  //                   fontWeight: FontWeight.w700,
  //                   fontSize: 18.sp,
  //                   color: AppColors.darkShadeBlue,
  //                 ),
  //                 const SizedBox(height: 20),
  //                 Roundbutton(
  //                   width: width,
  //                   padding_vertical: 15.h,
  //                   borderRadius: 6,
  //                   buttonColor: AppColors.primaryColor,
  //                   title: "Login",
  //                   onTap: () {
  //                     Get.to(() => SignInScreen(),
  //                         transition: Transition.rightToLeft,
  //                         duration: Duration(milliseconds: 500)
  //                     );
  //                   },
  //                 ),
  //                 const SizedBox(height: 15),
  //                 InkWell(
  //                   onTap: () {
  //                     Get.off(() => SignUpScreen(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 500));
  //                   },
  //                   child: Container(
  //                       alignment: Alignment.center,
  //                       decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.circular(6),
  //                           border: Border.all(
  //                               width: 1, color: AppColors.secondaryColor)),
  //                       width: width,
  //                       padding: EdgeInsets.symmetric(vertical: 10.h),
  //                       child: Text(
  //                         "Sign Up",
  //                         style: GoogleFonts.urbanist(
  //                             fontSize: 18.sp,
  //                             fontWeight: FontWeight.w700,
  //                             color: AppColors.secondaryColor),
  //                       )),
  //                 ),
  //                 const SizedBox(height: 20),
  //                 GestureDetector(
  //                   onTap: () {
  //                     Get.to(BrokerSignUpScreen());
  //                   },
  //                   child: Text.rich(
  //                     TextSpan(
  //                       children: [
  //                         TextSpan(
  //                             text: "If you want to work with us ",
  //                             style: GoogleFonts.urbanist(
  //                                 color: AppColors.darkShadeBlue,
  //                                 fontWeight: FontWeight.w400,
  //                                 fontSize: 16.sp)),
  //                         TextSpan(
  //                             text: "Click Here",
  //                             style: GoogleFonts.urbanist(
  //                                 color: AppColors.secondaryColor,
  //                                 fontWeight: FontWeight.w400,
  //                                 fontSize: 16.sp)
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         // Add the animated motorcycle at the bottom
  //         AnimatedBuilder(
  //           animation: _animation,
  //           builder: (context, child) {
  //             bool isMovingLeft = _controller.status == AnimationStatus.reverse;
  //             String imagePath = isMovingLeft
  //                 ? AppImages.discountMeBikeRight // Image for right-to-left
  //                 : AppImages.discountMeBike; // Image for left-to-right
  //
  //             return Positioned(
  //               bottom: 0,
  //               left: _animation.value * (width - 100), // Moves motorcycle left to right and back
  //               child: Image.asset(imagePath, scale: 4),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
