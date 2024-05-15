import 'package:e_commerce_app/features/controllers/product/images_controller.dart';
import 'package:e_commerce_app/features/screens/cart/cart_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/models/product_variation.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  //Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  //--Select Attribute, and Variation

  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    //when attribute is selected we will first add that attribute to the selectedAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (varaiation) =>
          _isSameAttributeValue(varaiation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    //show the selected varaition image as a main image
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectProductImage.value =
          selectedVariation.image;
    }

    //show the variation quantity already in the cart
    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value =
          cartController.getVariationQuantityInCart(
        product.id,
        selectedVariation.id,
      );
    }

    //assign selected variation
    this.selectedVariation.value = selectedVariation;

    //Update selected product variation status
    getProductVariationStockStatus();
  }

  //--Check If selected attributes matches any variation attributes
  bool _isSameAttributeValue(Map<String, dynamic> variationAttribute,
      Map<String, dynamic> selectedAttributes) {
    //if selectedattributes contains 3 attributes and current variation contains 2 then return.
    if (variationAttribute.length != selectedAttributes.length) return false;

    //if any of the attributes is different thenn return e.g:[green,large]x[green,small]
    for (final key in variationAttribute.keys) {
      //Attributes[key]=value which could be[green,small cotton]etc.
      if (variationAttribute[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  //--Check Attribute avaliability/stack in variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variation, String attributrName) {
    //pass the variation to check which attributes are avaliable and stock is not 0

    final avaliableVariationAttributeValues = variation
        .where((variation) =>
            //check empty/out of stock
            variation.attributeValues[attributrName] != null &&
            variation.attributeValues[attributrName]!.isNotEmpty &&
            variation.stock > 0)
        //fetch all non empty attributes of variables
        .map((variation) => variation.attributeValues[attributrName])
        .toSet();
    return avaliableVariationAttributeValues;
  }

  String getVariablePrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  //--check product variation stack status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  //--reset selected attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
