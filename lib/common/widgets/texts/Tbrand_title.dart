import 'package:e_commerce_app/utils/theme/constants/enums.dart';
import 'package:flutter/material.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText(
      {super.key,
      this.color,
      required this.title,
      this.maxLines = 1,
      this.textAlign = TextAlign.center,
      this.brandTextsize = Textsizes.small});

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final Textsizes brandTextsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: brandTextsize == Textsizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextsize == Textsizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextsize == Textsizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
