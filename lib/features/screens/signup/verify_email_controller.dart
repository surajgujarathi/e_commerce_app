import 'dart:async';

import 'package:e_commerce_app/common/success_screen/success_screen.dart';
import 'package:e_commerce_app/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  //send Email whenever verify screen appears and set the timer for auto redirect.

  @override
  void onInit() {
    sendEmailVerification();
    setTimerforAutoDirect();
    super.onInit();
  }

//send  email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email sent!',
          message: 'please check your inbox and verify your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'OH snap!', message: e.toString());
    }
  }

  setTimerforAutoDirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: TImages.success,
              title: TTexts.accountCreatedTitle,
              subtitle: TTexts.accountCreatedSubtitle,
              onpressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  //manually check if email verified
  checkEmailVerificationStatus() async {
    final currrentuser = FirebaseAuth.instance.currentUser;
    if (currrentuser != null && currrentuser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: TImages.lottie,
            title: TTexts.accountCreatedTitle,
            subtitle: TTexts.accountCreatedSubtitle,
            onpressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
