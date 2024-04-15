import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: THelperFunctions.isDarkmode(Get.context!)
                  ? TColors.dark
                  : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  TAnimationLoaderWidget(
                    text: text,
                    animation: animation,
                  )
                ],
              ),
            )));
  }

  static stoploading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
