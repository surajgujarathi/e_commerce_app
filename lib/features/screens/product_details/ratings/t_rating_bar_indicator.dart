import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TRatingbarIndicator extends StatelessWidget {
  const TRatingbarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: TColors.darkGrey,
        itemBuilder: (_, __) => const Icon(
              Iconsax.star,
              color: TColors.primary,
            ));
  }
}
