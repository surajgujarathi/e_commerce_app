import 'package:e_commerce_app/common/shimmer/boxes_shimmer.dart';
import 'package:e_commerce_app/common/shimmer/list_tile_shimmer.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_showcase.dart';
import 'package:e_commerce_app/features/controllers/product/brand_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/cloud_helper_functions.dart';
import 'package:flutter/widgets.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        //Handle Loader ,No record,or errro message

        const loader = Column(
          children: [
            TListTileShimmer(),
            SizedBox(height: Tsized.spaceBtwItems),
            TBoxesShimmer(),
            SizedBox(height: Tsized.spaceBtwItems),
          ],
        );
        final widget = TCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        //record found!
        final brands = snapshot.data!;

        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                future:
                    controller.getBrandProducts(limit: 3, brandId: brand.id),
                builder: (context, snapshot) {
                  //handle  loader no record or error message
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  //record found!
                  final products = snapshot.data!;
                  return TbrandShowcase(
                    images: products.map((e) => e.thumbnail).toList(),
                    brand: brand,
                  );
                },
              );
            });
      },
    );
  }
}
