import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/controllers/category_controller.dart';
import 'package:e_commerce_app/features/shop/models/brandmodel.dart';
import 'package:e_commerce_app/firebase_storage_services.dart';
import 'package:e_commerce_app/utils/theme/exceptions/format_exception.dart';
import 'package:e_commerce_app/utils/theme/exceptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../utils/theme/exceptions/firebase_execeptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }

  // Get brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      // Extract brandIds from the dacuments
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();

      // Query to get all document where the brandsId is in the list of brandIds,FieldPath.documentId to query documents in Collection
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }
  //upload brands data to the firebase

  Future<void> uploadBrandData(List<BrandModel> brands) async {
    try {
      // Upload all the brands along with their images
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each brand
      for (var brand in brands) {
        // Get image data link from the local assets
        final file = await storage.getImageDataFromAssets(brand.image);

        // Upload image and get its URL
        final url = await storage.uploadImageData('Brands', file, brand.id);

        // Assign URL to BrandModel.image attribute
        brand.image = url;

        // Store brand in Firestore
        await FirebaseFirestore.instance
            .collection('Brands')
            .doc(brand.id)
            .set(brand.toJson());
      }

      // Not sure what CategoryController does here, so keeping it as it is
      Get.put(CategoryController());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
