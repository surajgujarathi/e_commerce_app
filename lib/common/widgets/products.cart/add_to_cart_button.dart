import 'package:e_commerce_app/features/screens/cart/cart_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/theme/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/theme/constants/colors.dart';
import '../../../utils/theme/constants/sizes.dart';

class ProductCartAddToCartButton extends StatelessWidget {
  const ProductCartAddToCartButton({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
        } else {}
      },
      child: Container(
        decoration: const BoxDecoration(
            color: TColors.dark,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Tsized.cardRadiusMd),
                bottomLeft: Radius.circular(Tsized.productImageRadius))),
        child: const SizedBox(
          width: Tsized.iconLg * 1.2,
          height: Tsized.iconLg * 1.2,
          child: Center(
            child: Icon(
              Iconsax.add,
              color: TColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
