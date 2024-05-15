import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/screens/checkout/payement_tile.dart';
import 'package:e_commerce_app/features/shop/models/payement_method.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  static CheckOutController get instance => Get.find();

  final Rx<PayementMethodModel> selectPaymentMethod =
      PayementMethodModel.empty().obs;

  @override
  void onInit() {
    selectPaymentMethod.value =
        PayementMethodModel(image: TImages.visa, name: 'Visa');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethods(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(Tsized.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TSectionHeading(
                        title: 'Select Payment Method',
                        showActionButtton: false),
                    const SizedBox(height: Tsized.spaceBtwSections),
                    TPaymentTile(
                        paymentmethod: PayementMethodModel(
                            name: 'Paytm', image: TImages.paytm)),
                    const SizedBox(height: Tsized.spaceBtwSections / 2),
                    TPaymentTile(
                        paymentmethod: PayementMethodModel(
                            name: 'Google Pay', image: TImages.googlepay)),
                    const SizedBox(height: Tsized.spaceBtwSections / 2),
                    TPaymentTile(
                        paymentmethod: PayementMethodModel(
                            name: 'Visa', image: TImages.visa)),
                    const SizedBox(height: Tsized.spaceBtwSections / 2),
                  ],
                ),
              ),
            ));
  }
}
