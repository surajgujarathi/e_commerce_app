import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/features/screens/cart/cart_controller.dart';
import 'package:e_commerce_app/features/screens/cart/coupon_widget.dart';
import 'package:e_commerce_app/features/screens/cart/widget/cart_items.dart';
import 'package:e_commerce_app/features/screens/checkout/widgets/billing_adress_section.dart';
import 'package:e_commerce_app/features/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_app/features/screens/checkout/widgets/billing_payement_section.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:e_commerce_app/utils/theme/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../order/order_controller.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final dark = THelperFunctions.isDarkmode(context);
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');

    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Order Review',
            style: Theme.of(context).textTheme.headlineSmall,
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: Column(
          children: [
            //items in cart
            const TCartitems(
              showAddRemoveButton: false,
            ),
            const SizedBox(
              height: Tsized.spaceBtwInputFields,
            ),

            //--Coupon Textfield
            const TCouponCode(),

            const SizedBox(height: Tsized.spaceBtwSections),

            //billing section
            TRoundedContainer(
              padding: const EdgeInsets.all(Tsized.md),
              showBorder: true,
              backgroundColor: dark ? TColors.black : TColors.white,
              child: const Column(
                children: [
                  //pricing
                  TBillingAmountSections(),
                  SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),
                  Divider(),
                  SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),

                  //payement methods
                  TBillingPayementSection(),
                  SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),
                  TBillingAddressSection()
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => TLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed'),
            child: Text('Checkout \$$totalAmount')),
      ),
    );
  }
}
