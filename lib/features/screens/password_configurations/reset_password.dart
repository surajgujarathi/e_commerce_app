import 'package:e_commerce_app/utils/theme/constants.dart/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants.dart/sizes.dart';
import 'package:e_commerce_app/utils/theme/constants.dart/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../utils/theme/helpers/helpers_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(
              Tsized.defaultSpace,
            ),
            child: Column(
              children: [
                ///image with 60%screen width
                Image(
                  image: AssetImage(TImages.verify),
                  width: THelperFunctions.screenWidth() * 0.6,
                ),
                const SizedBox(
                  height: Tsized.spaceBtwSections,
                ),
                Text(
                  TTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Tsized.spaceBtwItems,
                ),
                Text(
                  TTexts.changeYourPasswordSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Tsized.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text(TTexts.done)),
                ),
                const SizedBox(
                  height: Tsized.spaceBtwItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child: const Text(TTexts.resendEmail)),
                ),
              ],
            )),
      ),
    );
  }
}
