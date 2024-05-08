import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/shimmer/shimmer.dart';
import 'package:e_commerce_app/common/widgets/brands/t_brand_card.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/features/screens/brand/brand_products.dart';
import 'package:e_commerce_app/features/shop/models/brandmodel.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TbrandShowcase extends StatelessWidget {
  const TbrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });
  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(Tsized.md),
        margin: const EdgeInsets.only(bottom: Tsized.spaceBtwItems),
        child: Column(
          children: [
            TBrandCard(
              showborder: false,
              brand: brand,
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),
            //brand top3 product images
            Row(
                children: images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList())
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
          height: 100,
          backgroundColor: THelperFunctions.isDarkmode(context)
              ? TColors.darkerGrey
              : TColors.light,
          margin: const EdgeInsets.only(right: Tsized.sm),
          padding: const EdgeInsets.all(Tsized.md),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, downloadprogress) =>
                const TShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )),
    );
  }
}
