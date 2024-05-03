import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brands/t_brand_card.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../sortable/sortable_products.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('PUMA'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showborder: true),
              SizedBox(
                height: Tsized.spaceBtwSections,
              ),
              TSortableProducts(
                products: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
