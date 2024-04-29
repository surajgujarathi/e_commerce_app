import 'package:e_commerce_app/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce_app/data/user/user_model.dart';
import 'package:e_commerce_app/data/user/user_repository.dart';
import 'package:e_commerce_app/features/controllers/login/re_authenticate_user_login_form.dart';
import 'package:e_commerce_app/features/screens/login/widgets/login.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:e_commerce_app/network_manager.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileloading = false.obs;

  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final imageUploading = false.obs;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileloading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileloading.value = false;
    }
  }

  //save user records from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      //refresh user record
      await fetchUserRecord();

      //if no record already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          //convert name to first and last name
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          //map data
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastNome:
                  nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
              username: username,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');

          //save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information.You can re-save your data in your Profile');
    }
  }

  //Delete Account Warning

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(Tsized.md),
        title: 'Delete Account',
        middleText:
            'Are You sure want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: Tsized.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text("cancel")));
  }

//Delete user Account

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.lottie);

      //First re-Authenticate User
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authuser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stoploading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stoploading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stoploading();
      TLoaders.warningSnackBar(title: 'OH snap', message: e.toString());
    }
  }

  //- - RE-Authenticate before deleting

  Future<void> reAuthenticateEmailAndpasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.lottie);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }

      if (!reAuthFormkey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateEmailAndpassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stoploading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stoploading();
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;

        //upload image
        final imageurl =
            await userRepository.uploadImage('user/Images/Profile/', image);

        //update user image record

        Map<String, dynamic> json = {'ProfilePicture': imageurl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageurl;
        user.refresh();
        TLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'OHSNAP', message: 'Something went wrong:$e');
    } finally {
      imageUploading.value = false;
    }
  }
}
