import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/firebase_storage_services.dart';
import 'package:e_commerce_app/utils/theme/constants/enums.dart';
import 'package:e_commerce_app/utils/theme/logging/logger.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/theme/exceptions/firebase_execeptions.dart';
import '../../utils/theme/exceptions/platform_exception.dart';

//Repostories for managing product-related data and operations
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  //Firestore instance for database interaction
  final _db = FirebaseFirestore.instance;

  //Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  //upload dummy data to the cloud firebase
  Future<void> uploadProductData(List<ProductModel> products) async {
    try {
      TLoggerHelper.error("1");
      //upload all the products along with their images
      final storage = Get.put(TFirebaseStorageService());

      TLoggerHelper.error("2");

      //loop through each products
      for (var product in products) {
        TLoggerHelper.error("3");
        //Get image data link from local assest
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        TLoggerHelper.error("4");

        //upload image and get its URL
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        TLoggerHelper.error("5");
        //assign URL to product thumbail attribute
        product.thumbnail = url;

        //Products list of images
        if (product.images != null && product.images!.isNotEmpty) {
          TLoggerHelper.error("6");
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            TLoggerHelper.error("7");
            //get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            TLoggerHelper.error("8u");

            //uplaod image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            //Assign url to product.thumnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        //upload brand images
        if (product.brand?.image != null) {
          final imageData =
              await storage.getImageDataFromAssets(product.brand!.image!);
          final url = await storage.uploadImageData(
              'Brands/Images', imageData, product.brand!.image!);
          product.brand!.image = url;
        }

        //upload variation images
        if (product.productType == ProductType.single.toString()) {
          for (var variation in product.productVariations!) {
            //Get image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            //upload image and get its url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            //assign URL to variation.image attritube
            variation.image = url;
          }
        }
        //store product in firestore

        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      TLoggerHelper.error("message ${e}");
      throw e.toString();
    }
  }
}
