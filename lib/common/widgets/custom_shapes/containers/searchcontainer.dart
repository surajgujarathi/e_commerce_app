import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/theme/helpers/helpers_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.ontap,
    this.padding = const EdgeInsets.symmetric(horizontal: Tsized.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? ontap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Tsized.xs),
        child: Container(
          width: TDeviceutils.getScreenWidth(context),
          padding: const EdgeInsets.all(Tsized.fontSizeMd),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? TColors.dark
                      : TColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(Tsized.cardRadiusLg),
              border: showBorder ? Border.all(color: TColors.grey) : null),
          child: Row(
            children: [
              Icon(icon, color: dark ? TColors.darkerGrey : Colors.grey),
              const SizedBox(
                width: Tsized.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
