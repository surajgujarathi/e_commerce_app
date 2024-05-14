import 'package:e_commerce_app/common/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/data/categories/category_brands.dart';
import 'package:e_commerce_app/features/controllers/category_controller.dart';
import 'package:e_commerce_app/features/screens/all_products/all_products.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Tcategorytab extends StatelessWidget {
  const Tcategorytab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            //brands
            children: [
              CategoryBrands(category: category),
              const SizedBox(height: Tsized.spaceBtwItems),
              //--Products

              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    // Helper Function : Handle Loader , No Record,OR ERROR Message
                    final response =
                        TCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: const TVerticalProductShimmer());
                    if (response != null) return response;

                    // Record Found!
                    final products = snapshot.data!;

                    return Column(
                      children: [
                        TSectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(Allproducts(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                                categoryId: category.id),
                          )),
                        ),

                        const SizedBox(
                          height: Tsized.spaceBtwItems,
                        ),

                        // TGridLayout(itemCount: 4, itemBuilder: (_, index) => TProductCardVertical(product: ProductModel.empty(),)),
                        //    const SizedBox(height: TSizes.spaceBtwSections,),
                        TGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => TProductCardVertical(
                            product: products[index],
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
