import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/user/user_model.dart';
import 'package:e_commerce_app/utils/theme/exceptions/firebase_execeptions.dart';
import 'package:e_commerce_app/utils/theme/exceptions/format_exception.dart';
import 'package:e_commerce_app/utils/theme/exceptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //functions to save user data firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("User").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somethimg went wrong .please try again';
    }
  }
}
