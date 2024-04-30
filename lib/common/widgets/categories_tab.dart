import 'package:e_commerce_app/common/widgets/brands/brand_showcase.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Tcategorytab extends StatelessWidget {
  const Tcategorytab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            //brands
            children: [
              TbrandShowcase(
                images: [TImages.jacket, TImages.nike1, TImages.nike2],
              ),
              TbrandShowcase(
                images: [TImages.jacket, TImages.nike1, TImages.nike2],
              ),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              TSectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              TGridLayout(
                itemCount: controller.featuredProducts.length,
                itemBuilder: (_, index) => TProductCardVertical(
                  product: controller.featuredProducts[index],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
