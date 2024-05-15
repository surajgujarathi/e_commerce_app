import 'package:e_commerce_app/features/controllers/address_controller.dart';
import 'package:e_commerce_app/features/controllers/product/checkout_controller.dart';
import 'package:e_commerce_app/features/screens/cart/cart_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  //Variables
  final cartController = CartController.instance;

  final addressController = AddressController.instance;
  final checkoutController = CheckOutController.instance;

  final orderRepository = Get.put(OrderRepository());
}
