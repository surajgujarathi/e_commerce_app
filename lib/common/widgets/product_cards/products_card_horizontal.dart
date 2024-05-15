import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/favourite_icon/favourite_icon.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand__verified_icon.dart';
import 'package:e_commerce_app/features/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/enums.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/theme/constants/sizes.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);

    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    return Container(
      width: 350,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Tsized.productImageRadius),
        color: dark ? TColors.darkGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          ///Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(Tsized.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                ///Thumbnail Image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                    imageurl: product.thumbnail,
                    applyImageradius: true,
                    isNetworkimage: true,
                  ),
                ),

                ///--Sale tag
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

                //Favourite icon button

                Positioned(
                  top: 0,
                  right: 0,
                  child: TFavouriteIcon(
                    productId: product.id,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: Tsized.sm, left: Tsized.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: product.title,
                        smallsize: true,
                      ),
                      const SizedBox(
                        height: Tsized.spaceBtwItems / 2,
                      ),
                      TBrandTitleWithVerifiedIcon(title: product.brand!.name)
                    ],
                  ),

                  const Spacer(),
                  //price row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price

                      Flexible(
                        child: Column(children: [
                          if (product.productType ==
                                  ProductType.single.toString() &&
                              product.salePrice > 0)
                            Padding(
                              padding: const EdgeInsets.only(left: Tsized.sm),
                              child: Text(
                                product.price.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                            ),

                          //Price,sale price as main price if sale exist
                          Padding(
                            padding: const EdgeInsets.only(left: Tsized.sm),
                            child: TProductPriceText(
                                price: controller.getProductPrice(product)),
                          ),
                        ]),
                      ),

                      //Add to cart button
                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Tsized.cardRadiusMd),
                                bottomLeft: Radius.circular(
                                    Tsized.productImageRadius))),
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
          ),
        ],
      ),
    );
  }
}
