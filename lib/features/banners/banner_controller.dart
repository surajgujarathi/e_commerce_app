import 'package:e_commerce_app/features/banners/banner_repository.dart';
import 'package:e_commerce_app/features/banners/models/banner_model.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  // Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // Update Page Navigational Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  // Fetch Banners

  Future<void> fetchBanners() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}










// // fetch categories from data source(firestore, API, etc.)
      // final categories = await _categoryRepository.getAllCategories();

      // // update the categories list

      // allCategories.assignAll(categories);
      // // filter featured categories

      // featuredCategories.assignAll(allCategories
      //     .where((category) => category.isFeatured && category.parentId.isEmpty)
      //     .take(8)
      //     .toList());