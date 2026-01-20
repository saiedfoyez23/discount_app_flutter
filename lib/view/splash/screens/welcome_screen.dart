import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';

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
          color: ColorUtils.white253,
        ),
        child: Stack(
          children: [

            Align(
              alignment: Alignment.bottomCenter,
              child: CustomImageContainer.assetImageContainer(
                height: 313.h(context),
                width: 428.w(context),
                assetImage: ImageUtils.welcomeBgMain,
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
                        assetImage: ImageUtils.discountMeLogo,
                        boxFit: BoxFit.contain,
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                      CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                        plainTextString: "Let’s get started!",
                        plainTextStringFontSize: 24.sp(context),
                        plainTextStringFontWeight: FontWeight.w700,
                        plainTextContainerAlignment: Alignment.center,
                        plainTextStringColor: ColorUtils.black29,
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),

                      CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                        plainTextString: "Login to Stay healthy and fit ",
                        plainTextStringFontSize: 18.sp(context),
                        plainTextStringFontWeight: FontWeight.w400,
                        plainTextContainerAlignment: Alignment.center,
                        plainTextStringColor: ColorUtils.black43,
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
                        plainButtonColor: ColorUtils.green176,
                        plainButtonHintFontColor: ColorUtils.white255,
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
                        plainButtonBorderColor: ColorUtils.orange125,
                        plainButtonBorderWidth: 1,
                        plainButtonHintFontColor: ColorUtils.orange125,
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 15.h(context)),

                      CustomRichTextContainer.plainRichTextContainerWidgetWithoutWidthHeight(
                          context: context,
                          plainPrimaryTextStringAlign: TextAlign.center,
                          plainPrimaryTextString: "If you want to work with us ",
                          plainRichTextStringFontSize: 20.sp(context),
                          plainRichTextStringColor: ColorUtils.black29,
                          plainRichTextStringFontWeight: FontWeight.w500,
                          textSpanList: [
                            TextSpan(
                              text: "Click Here",
                              style: CustomRichTextContainer.plainRichTextStringStyleWithDecoration(
                                  context: context,
                                  plainRichTextStringFontSize: 20.sp(context),
                                  plainRichTextStringColor: ColorUtils.orange125,
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
                    ? ImageUtils.discountMeBikeRight // Image for right-to-left
                    : ImageUtils.discountMeBike; // Image for left-to-right

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
}
