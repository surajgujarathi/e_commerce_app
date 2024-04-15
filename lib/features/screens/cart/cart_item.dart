import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand__verified_icon.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/constants/text_strings.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/images/t_rounded_image.dart';
import '../../../utils/theme/constants/colors.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Row(
      children: [
        TRoundedImage(
          imageurl: TImages.nike1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(Tsized.sm),
          backgroundcolor: THelperFunctions.isDarkmode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(
          height: Tsized.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(
                  textcolor: dark ? TColors.white : TColors.darkGrey,
                  title: TTexts.nike),
              const Flexible(
                child:
                    TProductTitleText(title: 'Sport Shoes', maxLines: 1),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Color',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Pink',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: 'Size',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'UK 08',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
