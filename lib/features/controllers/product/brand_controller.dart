import 'package:e_commerce_app/data/repositories.authentication/product_repositories.dart';
import 'package:e_commerce_app/features/screens/brand/brand_repositories.dart';
import 'package:e_commerce_app/features/shop/models/brandmodel.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = true.obs;

  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());
  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  //--Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      //show loader while loading Brands
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          allBrands..where((brands) => brands.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      //stop loader
      isLoading.value = false;
    }
  }
  //Get Brands for Category

  //Get Bradn Specific products from your data source
  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Ohh Snap!', message: e.toString());
      return [];
    }
  }
}
