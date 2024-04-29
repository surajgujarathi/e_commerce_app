import 'package:e_commerce_app/data/user/user_repository.dart';
import 'package:e_commerce_app/features/controllers/user_controller.dart';
import 'package:e_commerce_app/features/screens/profile/profile.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:e_commerce_app/network_manager.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastNome;
  }

  Future<void> updateUserName() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information.....', TImages.lottie);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }

      //form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }
      //update usrs first and last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastNome = lastName.text.trim();

      //remove loader
      TFullScreenLoader.stoploading();

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated');

      //move to previos screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
