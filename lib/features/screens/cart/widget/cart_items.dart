import 'package:e_commerce_app/features/screens/cart/add_remove_button.dart';
import 'package:e_commerce_app/features/screens/cart/cart_controller.dart';
import 'package:e_commerce_app/features/screens/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/texts/product_price_text.dart';
import '../../../../utils/theme/constants/sizes.dart';

class TCartitems extends StatelessWidget {
  const TCartitems({super.key, this.showAddRemoveButton = true});
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: Tsized.spaceBtwSections,
        ),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              //cart items
              TCartItem(cartItem: item),

              if (showAddRemoveButton)
                const SizedBox(height: Tsized.spaceBtwItems),

              //Add remove button row with total price
              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //extra space
                        const SizedBox(width: 70),

                        //Add remove buttons
                        TProductQuantitywithAddRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),

                    //--Product total price
                    TProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1))
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
