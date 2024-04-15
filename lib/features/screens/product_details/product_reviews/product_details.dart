import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/screens/product_details/product_reviews/widgets/over_all_products_rating.dart';
import 'package:e_commerce_app/features/screens/product_details/ratings/t_rating_bar_indicator.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar

      appBar: const TAppBar(
        title: Text('Reviews and Ratings'),
        showBackArrow: true,
      ),

      //body

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you see'),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),

              //overall product ratings
              const OverAllProductRating(),
              const TRatingbarIndicator(
                rating: 3.8,
              ),
              Text(
                '12,611',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: Tsized.spaceBtwSections,
              ),

              // USer reviews list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
