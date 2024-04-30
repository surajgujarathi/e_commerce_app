import 'package:e_commerce_app/common/shimmer/shimmer.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/searchcontainer.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/screens/all_products/all_products.dart';
import 'package:e_commerce_app/features/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_app/features/screens/home/widgets/promosliders.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            const TPrimaryHeaderContainer(
              child: Column(children: [
                //appbar
                THomeAppBar(),
                SizedBox(
                  height: Tsized.spaceBtwSections,
                ),
                //searchbar
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Tsized.defaultSpace),
                  child: TSearchContainer(
                    text: 'Search in store',
                  ),
                ),
                SizedBox(
                  height: Tsized.spaceBtwSections,
                ),
                //categories
                Padding(
                  padding: EdgeInsets.only(left: Tsized.defaultSpace),
                  child: Column(
                    children: [
                      //heading
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButtton: false,
                        textcolor: Colors.white,
                      ),
                      SizedBox(
                        height: Tsized.spaceBtwItems,
                      ),
                      //categories
                      THomeCategories()
                    ],
                  ),
                ),
                SizedBox(
                  height: Tsized.spaceBtwSections,
                )
              ]),
            ),

            //body
            Padding(
              padding: const EdgeInsets.all(Tsized.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const Allproducts()),
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TShimmerEffect(width: 30, height: 30);
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                        product: controller.featuredProducts[index],
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
