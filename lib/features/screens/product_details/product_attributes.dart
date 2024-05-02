import 'package:e_commerce_app/common/widgets/chips/choice_chips.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/controllers/product/variation_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkmode(context);
    return Obx(
      () => Column(
        children: [
          // selected attribute pricing and Description
          //display variation proce and stock some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(Tsized.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  // title , price , stock status

                  Row(
                    children: [
                      const TSectionHeading(
                        title: 'variation',
                        showActionButtton: false,
                      ),
                      const SizedBox(
                        width: Tsized.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Price: ',
                                smallsize: true,
                              ),

                              // actual price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),

                              const SizedBox(
                                width: Tsized.spaceBtwItems / 1.5,
                              ),
                              //sale price
                              TProductPriceText(
                                  price: controller.getVariablePrice())
                            ],
                          ),
                          //stack
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Stock: ',
                                smallsize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  // variation description
                  TProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallsize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          const SizedBox(
            height: Tsized.spaceBtwItems,
          ),

          // Attributes
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map(
                    (attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: attribute.name ?? '',
                          showActionButtton: false,
                        ),
                        const SizedBox(
                          height: Tsized.spaceBtwItems / 2,
                        ),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributevalue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributevalue;
                                final avaliable = controller
                                    .getAttributesAvailabilityInVariation(
                                        product.productVariations!,
                                        attribute.name!)
                                    .contains(attributevalue);
                                return TChoiceChip(
                                    text: attributevalue,
                                    selected: isSelected,
                                    onSelected: avaliable
                                        ? (selected) {
                                            if (selected && avaliable) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  attributevalue);
                                            }
                                          }
                                        : null);
                              }).toList()),
                        )
                      ],
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
