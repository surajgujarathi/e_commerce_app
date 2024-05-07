import 'package:e_commerce_app/common/shimmer/brand_shimmer.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brands/t_brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/screens/brand/brand_products.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product/brand_controller.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            //heading
            children: [
              const TSectionHeading(title: 'Brands'),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              //brands
              Obx(() {
                if (brandController.isLoading.value) {
                  return const TBrandsShimmer(
                    itemCount: 4,
                  );
                }

                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text(
                      'No data found!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.red),
                    ),
                  );
                }

                return TGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];

                      return TBrandCard(
                        showborder: true,
                        brand: brand,
                        Ontap: () => Get.to(() => BrandProducts(
                              brand: brand,
                            )),
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
