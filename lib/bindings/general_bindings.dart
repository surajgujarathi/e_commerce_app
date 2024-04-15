import 'package:e_commerce_app/network_manager.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
  }
}
