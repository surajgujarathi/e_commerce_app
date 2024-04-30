import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand__verified_icon.dart';
import 'package:e_commerce_app/features/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/enums.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class TproductMetaData extends StatelessWidget {
  const TproductMetaData({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = THelperFunctions.isDarkmode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //Sale Tag
            TRoundedContainer(
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
            const SizedBox(width: Tsized.spaceBtwItems),

            //PRICE
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            const SizedBox(width: Tsized.spaceBtwItems),
            TProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(width: Tsized.spaceBtwItems / 1.5),
        const TProductTitleText(
          title: 'Blue Nike Sport shoes',
        ),
        const SizedBox(width: Tsized.spaceBtwItems / 1.5),
        Row(
          children: [
            const TProductTitleText(
              title: 'Status',
            ),
            const SizedBox(width: Tsized.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(width: Tsized.spaceBtwItems / 1.5),
        Row(
          children: [
            TCircularImage(
              image: TImages.sneakers,
              width: 32,
              height: 32,
              overlaycolor: darkMode ? TColors.white : TColors.dark,
            ),
            const SizedBox(width: Tsized.spaceBtwItems / 1.5),
            const TBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: Textsizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
