import 'package:e_commerce_app/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/controllers/address_controller.dart';
import 'package:e_commerce_app/features/controllers/product/checkout_controller.dart';
import 'package:e_commerce_app/features/screens/cart/cart_controller.dart';
import 'package:e_commerce_app/features/screens/order/order_Model.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/theme/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../common/success_screen/success_screen.dart';
import '../../../utils/theme/constants/enums.dart';
import '../../../utils/theme/constants/image_strings.dart';
import 'order_repository.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  //Variables
  final cartController = CartController.instance;

  final addressController = AddressController.instance;
  final checkoutController = CheckOutController.instance;

  final orderRepository = Get.put(OrderRepository());

  //fetch users order history
  Future<List<OrderModel>> fetchUsersOrders() async {
    try {
      final userOrder = await orderRepository.fetchUserOrders();
      return userOrder;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'oh snap!', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      // Start loader
      TFullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.lottie);

      // Get user authentication id
      final userId = AuthenticationRepository.instance.authuser?.uid;
      if (userId == null || userId.isEmpty) {
        // Show error message if user ID is not available
        throw 'Unable to process order. User ID is null or empty.';
      }

      // Create order
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set delivery date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.clearCart();

      // Show success screen
      Get.off(() => SuccessScreen(
            image: TImages.success,
            title: 'Payment Success!',
            subtitle: 'Your item will be shipped soon!',
            onpressed: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      // Show error message
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
