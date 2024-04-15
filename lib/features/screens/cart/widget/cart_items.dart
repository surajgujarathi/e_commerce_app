import 'package:e_commerce_app/features/screens/cart/add_remove_button.dart';
import 'package:e_commerce_app/features/screens/cart/cart_item.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/texts/product_price_text.dart';
import '../../../../utils/theme/constants/sizes.dart';

class TCartitems extends StatelessWidget {
  const TCartitems({super.key, this.showAddRemoveButton = true});
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 2,
        separatorBuilder: (_, __) => const SizedBox(
              height: Tsized.spaceBtwSections,
            ),
        itemBuilder: (_, index) => Column(
              children: [
                const TCartItem(),
                if (showAddRemoveButton)
                  const SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),
                if (showAddRemoveButton)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 70,
                          ),
                          TProductQuantitywithAddRemoveButton(),
                        ],
                      ),
                      TProductPriceText(price: '256')
                    ],
                  ),
              ],
            ));
  }
}
