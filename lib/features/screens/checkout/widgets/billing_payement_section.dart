import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/controllers/product/checkout_controller.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBillingPayementSection extends StatelessWidget {
  const TBillingPayementSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutController());
    final dark = THelperFunctions.isDarkmode(context);
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment method',
          buttonTitle: 'Change',
          onPressed: () => controller.selectPaymentMethods(context),
        ),
        const SizedBox(
          height: Tsized.spaceBtwItems / 2,
        ),
        Obx(
          () => Row(
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? TColors.light : TColors.white,
                padding: const EdgeInsets.all(Tsized.sm),
                child: Image(
                  image: AssetImage(controller.selectPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: Tsized.spaceBtwItems / 2,
              ),
              Text(
                controller.selectPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}
