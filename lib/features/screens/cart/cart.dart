import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/screens/cart/widget/cart_items.dart';
import 'package:e_commerce_app/features/screens/checkout/checkout.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          )),
      body: const Padding(
          padding: EdgeInsets.all(Tsized.defaultSpace), child: TCartitems()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckOutScreen()),
            child: const Text('Checkou\$256.0')),
      ),
    );
  }
}
