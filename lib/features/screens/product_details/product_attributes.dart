import 'package:e_commerce_app/common/widgets/chips/choice_chips.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Column(
      // selected attribute pricing and Description
      children: [
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
                          Text(
                            '₹ 950',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),

                          const SizedBox(
                            width: Tsized.spaceBtwItems / 1.5,
                          ),
                          const TProductPriceText(price: ' 700')
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock: ',
                            smallsize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              // variation description
              const TProductTitleText(
                title:
                    'This is the description of product and can go up to maximum 4 lines',
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
          children: [
            const TSectionHeading(
              title: 'Colours',
              showActionButtton: false,
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Red',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Size',
              showActionButtton: false,
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: ' 28',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: '30',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: '32',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: '34',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
