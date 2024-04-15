import 'package:e_commerce_app/features/aunthentication/screens/widgets/onboarding.dart';
import 'package:e_commerce_app/features/screens/login/widgets/login.dart';
import 'package:e_commerce_app/utils/theme/exceptions/firebase_execeptions.dart';
import 'package:e_commerce_app/utils/theme/exceptions/platform_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/theme/exceptions/format_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final devicestorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    if (kDebugMode) {
      print('=============GET STORAGE Auth Repo===========');
      print(devicestorage.read('IsFirstTime'));
    }
    devicestorage.writeIfNull('IsFirstTime', true);
    devicestorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  //[email authnrication]signin
  //[email authnrication]register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'something went wrong. please try again';
    }
  }
}
