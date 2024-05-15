
import 'package:e_commerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/theme/constants/colors.dart';
import '../../../utils/theme/constants/sizes.dart';

class TProductQuantitywithAddRemoveButton extends StatelessWidget {
  const TProductQuantitywithAddRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });
  final int quantity;
  final VoidCallback? add, remove;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: Tsized.md,
          color: THelperFunctions.isDarkmode(context)
              ? TColors.white
              : TColors.black,
          backgroundColor: THelperFunctions.isDarkmode(context)
              ? TColors.darkerGrey
              : TColors.light,
          onPressed: remove,
        ),
        const SizedBox(
          width: Tsized.spaceBtwItems,
        ),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(
          width: Tsized.spaceBtwItems,
        ),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: Tsized.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
