import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  //Variables
  RxString selectProductImage = ''.obs;

  ///--Get all images from product and variables
  List<String> getAllProductImages(ProductModel product) {
    //Use Set to add unique images only
    Set<String> images = {};

    //load thumbnail images
    images.add(product.thumbnail);

    //Assign Thumbnail as selected Image
    selectProductImage.value = product.thumbnail;

    //Get all images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    //Get all images from the product Variations if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }
    return images.toList();
  }

  //--Show Image Popup
  void showEnlargedImages(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Tsized.defaultSpace * 2,
                        horizontal: Tsized.defaultSpace),
                  ),
                  const SizedBox(height: Tsized.spaceBtwSections),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Close')),
                    ),
                  )
                ],
              ),
            ));
  }
}
