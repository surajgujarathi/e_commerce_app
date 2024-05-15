import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/features/controllers/product/checkout_controller.dart';
import 'package:e_commerce_app/features/shop/models/payement_method.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TPaymentTile extends StatelessWidget {
  const TPaymentTile({super.key, required this.paymentmethod});

  final PayementMethodModel paymentmethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckOutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectPaymentMethod.value = paymentmethod;
        Get.back();
      },
      leading: TRoundedContainer(
          width: 60,
          height: 40,
          padding: const EdgeInsets.all(Tsized.sm),
          backgroundColor: THelperFunctions.isDarkmode(context)
              ? TColors.light
              : TColors.white,
          child: Image(
              image: AssetImage(paymentmethod.image), fit: BoxFit.contain)),
      title: Text(paymentmethod.name),
      trailing: const Icon(Iconsax.arrow_right),
    );
  }
}
