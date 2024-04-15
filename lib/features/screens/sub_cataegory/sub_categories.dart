import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/product_cards/products_card_horizontal.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Sports Shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: Column(
          children: [
            TRoundedImage(
                imageurl: TImages.pumac,
                width: double.infinity,
                applyImageradius: true),
            const SizedBox(
              height: Tsized.spaceBtwSections,
            ),
            Column(
              children: [
                TSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                const SizedBox(
                  height: Tsized.spaceBtwSections / 2,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                            width: Tsized.spaceBtwItems,
                          ),
                      itemBuilder: (context, index) =>
                          const TProductCardHorizontal()),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
