import 'package:e_commerce_app/utils/theme/constants.dart/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants.dart/sizes.dart';
import 'package:e_commerce_app/utils/theme/constants.dart/text_strings.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          child: Image.asset(
            dark ? TImages.lightAppLogo : TImages.darkAppLogo,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: Tsized.sm,
        ),
        Text(
          TTexts.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
