import 'package:e_commerce_app/features/screens/product_details/product_details_image_slider.dart';
import 'package:e_commerce_app/features/screens/product_details/product_meta_data.dart';
import 'package:e_commerce_app/features/screens/product_details/rating_share_widget.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image slider
            TProductImageSlider(),
            Padding(
              padding: EdgeInsets.only(
                  right: Tsized.defaultSpace,
                  left: Tsized.defaultSpace,
                  bottom: Tsized.defaultSpace),
              child: Column(
                children: [TRatingAndShare(), TproductMetaData()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
