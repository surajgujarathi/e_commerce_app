import 'package:e_commerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/theme/helpers/helpers_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Tsized.defaultSpace, vertical: Tsized.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Tsized.cardRadiusLg),
          topRight: Radius.circular(Tsized.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
              const SizedBox(
                width: Tsized.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: Tsized.spaceBtwItems,
              ),
              const TCircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(Tsized.md),
                  backgroundColor: TColors.black,
                  side: const BorderSide(color: TColors.black)),
              onPressed: () {},
              child: const Text('Add to cart'))
        ],
      ),
    );
  }
}
