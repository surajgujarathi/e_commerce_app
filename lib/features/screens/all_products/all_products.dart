import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/screens/sortable/sortable_products.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';

class Allproducts extends StatelessWidget {
  const Allproducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Popular Products'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Tsized.defaultSpace),
        child: TSortableProducts(),
      ),
    );
  }
}
