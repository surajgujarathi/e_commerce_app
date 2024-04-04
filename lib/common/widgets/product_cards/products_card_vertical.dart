import 'package:e_commerce_app/common/widgets/texts/Tbrand_title_verified_icon.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/theme/constants/sizes.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textcolor,
    this.iconColor = TColors.primary,
    this.textAllign = TextAlign.center,
    this.brandTextSize = Textsizes.small,
  });
  final String title;
  final int maxLines;
  final Color? textcolor, iconColor;
  final TextAlign? textAllign;
  final Textsizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
          child: TBrandTitleText(
        title: title,
        color: textcolor,
        maxLines: maxLines,
        textAlign: textAllign,
        brandTextsize: brandTextSize,
      )),
      SizedBox(
        width: Tsized.xs,
      ),
      Icon(
        Iconsax.verify,
        color: iconColor,
        size: Tsized.iconXs,
      )
    ]);
  }
}
