import 'package:e_commerce_app/common/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brands/t_brand_card.dart';
import 'package:e_commerce_app/features/controllers/product/brand_controller.dart';
import 'package:e_commerce_app/features/shop/models/brandmodel.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

import '../sortable/sortable_products.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            children: [
              TBrandCard(
                showborder: true,
                brand: brand,
              ),
              const SizedBox(
                height: Tsized.spaceBtwSections,
              ),
              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  //handle error,No record,Or errror message
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  //record brand
                  final brandProducts = snapshot.data!;
                  return TSortableProducts(
                    products: brandProducts,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
