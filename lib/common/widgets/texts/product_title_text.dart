import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText(
      {super.key,
      required this.title,
      required this.smallsize,
      this.maxLines = 2,
      this.textAlign});

  final String title;
  final bool smallsize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallsize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
