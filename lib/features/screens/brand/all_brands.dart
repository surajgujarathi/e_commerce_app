import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brands/t_brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/screens/brand/brand_products.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(
                title: 'Brands',
                showActionButtton: false,
              ),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => TBrandCard(
                        showborder: true,
                        Ontap: () => Get.to(() => const BrandProducts()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
