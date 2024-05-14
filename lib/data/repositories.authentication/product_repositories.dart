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

//Get dummy data

  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }

  // Get Products for Category
  Future<List<ProductModel>> getProductsForCategory({
    required String categoryId,
  }) async {
    try {
      // Query to get all documents where productId matches the provided categoryId & Fetch limited or unlimited based on limit

      QuerySnapshot productCategoryQuery = await _db
          .collection('ProductCategory')
          .where('CategoryId', isEqualTo: categoryId)
          .get();

      // Extract productIds from the documents
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in Collection

      final productsQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      // Extract brand names or other relevant data from the documents

      List<ProductModel> products = productsQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Get limited featured products

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
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

  //Get products based on the Brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      //final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productsIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productsIds)
          .get();

      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
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
              await storage.getImageDataFromAssets(product.brand!.image);
          final url = await storage.uploadImageData(
              'Brands/Images', imageData, product.brand!.image);
          product.brand!.image = url;
        }

        //upload variation images
        if (product.productType == ProductType.variable.toString()) {
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
      TLoggerHelper.error("message $e");
      throw e.toString();
    }
  }
}
