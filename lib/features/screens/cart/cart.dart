import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/features/screens/cart/cart_controller.dart';
import 'package:e_commerce_app/features/screens/cart/widget/cart_items.dart';
import 'package:e_commerce_app/features/screens/checkout/checkout.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          )),
      body: Obx(() {
        //Nothing Found widget
        final emptyWidget = TAnimationLoaderWidget(
          animation: TImages.lottie,
          showAction: true,
          text: 'Whoopss! cart is empty',
          actionText: 'Lets\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(Tsized.defaultSpace),

                //Items in cart
                child: TCartitems()),
          );
        }
      }),

      //CheckOut Button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(Tsized.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckOutScreen()),
                  child: Obx(() =>
                      Text('checkout\$${controller.totalCartPrice.value}'))),
            ),
    );
  }
}
