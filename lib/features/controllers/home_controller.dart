import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // Use RxInt for reactive integer
  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(int index) {
    carousalCurrentIndex.value = index; // Ensure index is positive
  }
}
