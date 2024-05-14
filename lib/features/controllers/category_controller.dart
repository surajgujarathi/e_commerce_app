import 'package:e_commerce_app/data/categories/categories_repository.dart';
import 'package:e_commerce_app/data/repositories.authentication/product_repositories.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isloading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // load category data
  Future<void> fetchCategories() async {
    try {
      // show loader while loading categories
      isloading.value = true;

      // fetch categories from data source(firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // update the categories list

      allCategories.assignAll(categories);
      // filter featured categories

      featuredCategories.assignAll(
          allCategories.where((category) => category.isFeatured).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //remove loader

      isloading.value = false;
    }
  }

  // load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Get category or sub category products
  Future<List<ProductModel>> getCategoryProducts({
    required String categoryId,
  }) async {
    try {
      //fetch limited(4)products against each subcategory
      final products = await ProductRepository.instance.getProductsForCategory(
        categoryId: categoryId,
      );
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'OHH snap!', message: e.toString());
      return [];
    }
  }
}
