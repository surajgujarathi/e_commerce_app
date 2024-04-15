import 'package:e_commerce_app/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce_app/data/user/user_model.dart';
import 'package:e_commerce_app/data/user/user_repository.dart';
import 'package:e_commerce_app/features/screens/signup/verify_email.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:e_commerce_app/network_manager.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //variables
  final hidepassword = true.obs; //obeservable foe hiding /showing passwords
  final privacypolicy = true.obs; //obeservable for privacy policy acceptance

  final email =
      TextEditingController(); // conntroller fir inputs like email, lastname etc.
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phonenumber = TextEditingController();
  GlobalKey<FormState> signupformKey =
      GlobalKey<FormState>(); // form key for validaation
  // signup

  void signup() async {
    try {
      // start loading

      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.lottie);

      // check internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }

      // form validation
      if (!signupformKey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }

      //privacy policy check
      if (!privacypolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In Order to create account,you must have to read and accept the privacy policy & Terms of use');
        TFullScreenLoader.stoploading();
        return;
      }

      // Register user in the firebase Authentication & save user data in the firebase
      final UserCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authenticated user data in the firebase
      final newUser = UserModel(
        id: UserCredential.user!.uid,
        firstName: firstname.text.trim(),
        lastNome: lastname.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phonenumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      //remove loader
      TFullScreenLoader.stoploading();

      // show success message

      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'your account has been created! Verify email to continue.');

      // move to verify email screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      TFullScreenLoader.stoploading();
      // show some genric error to user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
