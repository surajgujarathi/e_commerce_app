import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/loaders.dart';

import 'package:get/get.dart';

import '../../../data/repositories.authentication/product_repositories.dart';
import '../../../utils/theme/constants/enums.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      //fetch Products
      final products = await productRepository.getFeaturedProducts();

      //Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh SNAP', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //Get products price or price range for variation
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    //if no variations exist ,return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      //calculates the smallest and largest prices among variation
      for (var variation in product.productVariations!) {
        //determine the price to consider
        double priceConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //update smallest and largest prices
        if (priceConsider < smallestPrice) {
          largestPrice = priceConsider;
        }
        if (priceConsider > largestPrice) {
          largestPrice = priceConsider;
        }
      }
      //if smallest and largest prices are same return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        //otherwise retuen price range
        return '$smallestPrice -\$$largestPrice';
      }
    }
  }

//calculates discount percentage

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  //check product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out Of stock';
  }
}
