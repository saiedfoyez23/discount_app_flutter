import 'package:discount_me_app/view/users/home_view/controller/caroasel_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../res/app_const/import_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderView extends StatefulWidget {
  SliderView({super.key});

  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> with SingleTickerProviderStateMixin {
  final CarouselSliderController controller = Get.put(CarouselSliderController());

  // List of image assets (you can replace these with URLs if using network images)
  final List<String> imageList = [
    AppImages.sliderImg, // Replace with actual asset paths or URLs
    AppImages.sliderImg,
    AppImages.sliderImg,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Adjusted height for a better view
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                controller.onPageChanged(value);
              },
              controller: controller.pageController,
              scrollDirection: Axis.horizontal,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return _buildScalingTransition(imageList[index], index);
              },
            ),
          ),
          const SizedBox(height: 10), // Add spacing between the slider and the indicator
          SmoothPageIndicator(
            controller: controller.pageController,
            count: imageList.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.deepPurple,
              dotColor: Colors.deepPurple.shade100,
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
        ],
      ),
    );
  }

  // Method to build a scaling transition
  Widget _buildScalingTransition(String image, int index) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.8, end: 1.0), // Scaling from 50% to 100%
      duration: const Duration(milliseconds: 600),
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale, // Scale the image
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
