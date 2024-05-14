import 'package:e_commerce_app/common/shimmer/horizontal_product_shimmer.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/product_cards/products_card_horizontal.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/controllers/category_controller.dart';
import 'package:e_commerce_app/features/screens/all_products/all_products.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: Column(
          children: [
            //Banner
            TRoundedImage(
                imageurl: TImages.pumac,
                width: double.infinity,
                applyImageradius: true),
            const SizedBox(
              height: Tsized.spaceBtwSections,
            ),

            //sub categories
            FutureBuilder(
              future: controller.getSubCategories(category.id),
              builder: (context, snapshot) {
                //handle loader no record,no error message
                const loader = THorizontalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                //Record  found
                final subCategories = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: subCategories.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final subCategory = subCategories[index];

                    return FutureBuilder(
                      future: controller.getCategoryProducts(
                          categoryId: subCategory.id),
                      builder: (context, snapshot) {
//handle loader no record,no error message

                        final widget =
                            TCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot, loader: loader);
                        if (widget != null) return widget;

                        //Congratulations Record found
                        final products = snapshot.data!;

                        return Column(
                          children: [
                            //Heading
                            TSectionHeading(
                              title: subCategory.name,
                              onPressed: () => Get.to(
                                () => Allproducts(
                                  title: subCategory.name,
                                  futureMethod: controller.getCategoryProducts(
                                      categoryId: subCategory.id),
                                ),
                              ),
                            ),
                            const SizedBox(height: Tsized.spaceBtwSections / 2),

                            SizedBox(
                              height: 120,
                              child: ListView.separated(
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: Tsized.spaceBtwItems,
                                      ),
                                  itemBuilder: (context, index) =>
                                      TProductCardHorizontal(
                                        product: products[index],
                                      )),
                            )
                          ],
                        );
                      },
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
