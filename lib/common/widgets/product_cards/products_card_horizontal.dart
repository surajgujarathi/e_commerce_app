import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand__verified_icon.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/theme/constants/sizes.dart';
import '../icons/t_circular_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Container(
      width: 350,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Tsized.productImageRadius),
        color: dark ? TColors.darkGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(Tsized.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                      imageurl: TImages.shoe, applyImageradius: true),
                ),
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: Tsized.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: Tsized.sm, vertical: Tsized.xs),
                    child: Text(
                      '25%',
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
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: Tsized.sm, left: Tsized.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: 'Blue Shoes ',
                        smallsize: true,
                      ),
                      SizedBox(
                        height: Tsized.spaceBtwItems / 2,
                      ),
                      TBrandTitleWithVerifiedIcon(title: 'Puma')
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: TProductPriceText(price: '256.0')),
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
