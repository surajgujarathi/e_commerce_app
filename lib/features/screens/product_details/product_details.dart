import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/screens/product_details/bottom_add_to_card_widget.dart';
import 'package:e_commerce_app/features/screens/product_details/product_attributes.dart';
import 'package:e_commerce_app/features/screens/product_details/product_details_image_slider.dart';
import 'package:e_commerce_app/features/screens/product_details/product_meta_data.dart';
import 'package:e_commerce_app/features/screens/product_details/product_reviews/product_details.dart';
import 'package:e_commerce_app/features/screens/product_details/rating_share_widget.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image slider
            TProductImageSlider(product: product),

            Padding(
              padding: const EdgeInsets.only(
                  right: Tsized.defaultSpace,
                  left: Tsized.defaultSpace,
                  bottom: Tsized.defaultSpace),
              child: Column(
                children: [
                  //rating and share button
                  const TRatingAndShare(),

                  //price,title,stocks&brand

                  TproductMetaData(
                    product: product,
                  ),
                  const SizedBox(height: Tsized.spaceBtwItems),
                  //attributes

                  const TProductAttributes(),

                  const SizedBox(height: Tsized.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('CheckOut'),
                    ),
                  ),
                  const SizedBox(height: Tsized.spaceBtwSections),
                  const TSectionHeading(
                      title: 'Description', showActionButtton: false),
                  const SizedBox(height: Tsized.spaceBtwItems),
                  const ReadMoreText(
                    'This is a product description for the brand nike shoes , there are more things that cam be added into it but for now i only added this in the read more text widget...',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Reviews(199)',
                        showActionButtton: false,
                      ),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewScreen()),
                          icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
