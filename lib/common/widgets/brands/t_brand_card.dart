import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand__verified_icon.dart';
import 'package:e_commerce_app/features/shop/models/brandmodel.dart';
import 'package:e_commerce_app/utils/theme/constants/enums.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../custom_shapes/containers/rounded_container.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.Ontap,
    required this.showborder,
    required this.brand,
  });
  final bool showborder;
  final void Function()? Ontap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(Tsized.sm),
        showBorder: showborder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: TCircularImage(
                ///--Icons
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                // overlaycolor: THelperFunctions.isDarkmode(context)
                //     ? TColors.white
                //     : TColors.black,
                image: brand.image,
              ),
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems / 2,
            ),

            ///--Texts
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: brand.name,
                    brandTextSize: Textsizes.large,
                  ),
                  Text(
                    '${brand.productsCount ?? 0}products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
