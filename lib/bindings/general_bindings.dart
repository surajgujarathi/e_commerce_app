import 'package:e_commerce_app/features/controllers/address_controller.dart';
import 'package:e_commerce_app/features/controllers/product/checkout_controller.dart';
import 'package:e_commerce_app/features/controllers/product/variation_controller.dart';
import 'package:e_commerce_app/network_manager.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckOutController());
  }
}
