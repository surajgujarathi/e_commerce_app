import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/banners/models/banner_model.dart';
import 'package:e_commerce_app/firebase_storage_services.dart';
import 'package:e_commerce_app/utils/theme/exceptions/firebase_execeptions.dart';
import 'package:e_commerce_app/utils/theme/exceptions/format_exception.dart';
import 'package:e_commerce_app/utils/theme/exceptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TFormatException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadBannerData(List<BannerModel> banners) async {
    try {
      //upload all the categories along with thier images
      final storage = Get.put(TFirebaseStorageService());

      //loop through each category
      for (var banner in banners) {
        //Get imagedata link from the local assets

        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        //upload image and get its URL
        final url =
            await storage.uploadImageData('Banners', file, banner.targetScreen);

        //assign url to Category.image attribute
        banner.imageUrl = url;

        //store category in firestore
        await _db
            .collection('Banners')
            .doc(banner.targetScreen)
            .set(banner.toJson());
      }
      Get.put(CategoryController());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somethimg went wrong .please try again';
    }
  }
}
