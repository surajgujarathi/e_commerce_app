import 'package:e_commerce_app/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/controllers/user_controller.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:e_commerce_app/network_manager.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //variable
  final rememberme = false.obs;
  final hidePassword = true.obs;
  final localstorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final focuspassword = FocusNode();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  @override
  void onInit() {
    email.text = localstorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localstorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  //----Email and password signIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      //start Loading
      TFullScreenLoader.openLoadingDialog('Logging You in..', TImages.lottie);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }
      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }
      //Save data if remember me is selected
      if (rememberme.value) {
        localstorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localstorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      //login user using email and password authentication
      final userCredential = await AuthenticationRepository.instance
          .loginwithEmailandPassword(email.text.trim(), password.text.trim());

      //remove Loader
      TFullScreenLoader.stoploading();

      //Redirect

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.errorSnackBar(title: 'OH SNAP', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.lottie);
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }
      //Google Authentication

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user record

      await userController.saveUserRecord(userCredentials);
      //remove loader

      TFullScreenLoader.stoploading();

      //rediect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //remove loader
      TFullScreenLoader.stoploading();

      TLoaders.errorSnackBar(title: 'Oh dear', message: e.toString());
    }
  }
}
