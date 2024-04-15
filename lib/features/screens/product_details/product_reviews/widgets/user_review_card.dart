import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../ratings/t_rating_bar_indicator.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.profile),
                ),
                const SizedBox(
                  width: Tsized.spaceBtwItems,
                ),
                Text(
                  'Suraj Gujarathi',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        const SizedBox(
          height: Tsized.spaceBtwItems,
        ),
        //reviews
        Row(
          children: [
            const TRatingbarIndicator(rating: 4),
            const SizedBox(
              width: Tsized.spaceBtwItems,
            ),
            Text('6 JAN 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          width: Tsized.spaceBtwItems,
        ),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate nad make purchase seamlessly. Great job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'show more',
          trimExpandedText: ' show less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(
          height: Tsized.spaceBtwItems,
        ),

        //company reviews

        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(Tsized.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('P&C', style: Theme.of(context).textTheme.titleMedium),
                    Text('8 JULY 2024',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(
                  height: Tsized.spaceBtwItems,
                ),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate nad make purchase seamlessly. Great job!',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'show more',
                  trimExpandedText: ' show less',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: Tsized.spaceBtwSections,
        ),
      ],
    );
  }
}
