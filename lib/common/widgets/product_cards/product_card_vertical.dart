import 'package:e_commerce_app/common/styles/shadows.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand__verified_icon.dart';
import 'package:e_commerce_app/features/controllers/product_controller.dart';
import 'package:e_commerce_app/features/screens/product_details/product_details.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/theme/constants/enums.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkmode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(
            productModel: product,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.veticalProductionShadow],
          borderRadius: BorderRadius.circular(Tsized.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            //Thumbnail wishlist button ,Discount tag
            TRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(Tsized.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //--thumbnail image
                  Center(
                    child: TRoundedImage(
                      imageurl: product.thumbnail,
                      applyImageradius: true,
                      isNetworkimage: true,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: Tsized.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: Tsized.sm, vertical: Tsized.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: Tsized.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.title, smallsize: true),
                  const SizedBox(height: Tsized.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(
                    title: product.brand!.name,
                  )
                ],
              ),
            ),
            //price row
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(children: [
                    if (product.productType == ProductType.single.toString() &&
                        product.salePrice > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: Tsized.sm),
                        child: Text(
                          product.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: Tsized.sm),
                      child: TProductPriceText(
                          price: controller.getProductPrice(product)),
                    ),
                  ]),
                ),

                //add to cart button
                Container(
                  decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Tsized.cardRadiusMd),
                          bottomLeft:
                              Radius.circular(Tsized.productImageRadius))),
                  child: const SizedBox(
                    width: Tsized.iconLg * 1.2,
                    height: Tsized.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
