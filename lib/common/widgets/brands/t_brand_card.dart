import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand__verified_icon.dart';
import 'package:e_commerce_app/utils/theme/constants/enums.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/constants/colors.dart';
import '../custom_shapes/containers/rounded_container.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.Ontap,
    required this.showborder,
  });
  final bool showborder;
  final void Function()? Ontap;

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
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlaycolor: THelperFunctions.isDarkmode(context)
                    ? TColors.white
                    : TColors.black,
                image: TImages.sneakers,
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
                  const TBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: Textsizes.large,
                  ),
                  Text(
                    '256 Products',
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
