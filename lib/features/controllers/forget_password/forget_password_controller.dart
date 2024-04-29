import 'package:e_commerce_app/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/screens/password_configurations/reset_password.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:e_commerce_app/network_manager.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //send reset passowrd email

  sendPasswordResetEmail() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your Request...', TImages.lottie);

      //check internet activity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
        //form validation
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //remove loader
      TFullScreenLoader.stoploading();

      //show Success Screen

      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link to sent to reset your password'.tr);

      //redirect
      Get.to(() => ResetPassword(
            email: email.text.trim(),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your Request...', TImages.lottie);

      //check internet activity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }
      //send email to reset password

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //remove loader
      TFullScreenLoader.stoploading();

      //show Success Screen

      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link to sent to reset your password'.tr);

      //redirect
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
