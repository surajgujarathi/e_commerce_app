import 'package:e_commerce_app/features/aunthentication/screens/onboarding_controller.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onBoarding_page.dart';
import 'onBoarding_skip.dart';
import 'onboarding_dot_navigation.dart';
import 'onboarding_next_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      OnBoardingController(),
    );

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              onBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingtitle1,
                subtitle: TTexts.onBoardingSubtitle1,
              ),
              onBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingtitle2,
                subtitle: TTexts.onBoardingSubtitle2,
              ),
              onBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingtitle3,
                subtitle: TTexts.onBoardingSubtitle3,
              ),
            ],
          ),
          const OnBoardSkip(),
          const onBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
