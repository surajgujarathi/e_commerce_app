import 'package:e_commerce_app/features/aunthentication/screens/onboarding_controller.dart';
import 'package:e_commerce_app/utils/theme/constants.dart/colors.dart';
import 'package:e_commerce_app/utils/theme/constants.dart/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingDotNavigation extends StatelessWidget {
  const onBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkmode(context);
    return Positioned(
      bottom: Tsized.defaultSpace,
      left: Tsized.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColors.light : TColors.black, dotHeight: 6),
      ),
    );
  }
}
