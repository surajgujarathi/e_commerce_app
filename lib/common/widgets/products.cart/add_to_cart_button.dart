import 'package:e_commerce_app/features/screens/cart/cart_controller.dart';
import 'package:e_commerce_app/features/screens/product_details/product_details.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/theme/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/theme/constants/colors.dart';
import '../../../utils/theme/constants/sizes.dart';

class ProductCartAddToCartButton extends StatelessWidget {
  const ProductCartAddToCartButton({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetail(product: product));
        }
      },
      child: Obx(() {
        final productQunatityIncart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
              color: productQunatityIncart > 0 ? TColors.primary : TColors.dark,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Tsized.cardRadiusMd),
                  bottomLeft: Radius.circular(Tsized.productImageRadius))),
          child: SizedBox(
            width: Tsized.iconLg * 1.2,
            height: Tsized.iconLg * 1.2,
            child: Center(
              child: productQunatityIncart > 0
                  ? Text(
                      productQunatityIncart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: TColors.white),
                    )
                  : const Icon(
                      Iconsax.add,
                      color: TColors.white,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
