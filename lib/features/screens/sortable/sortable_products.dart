import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
          onChanged: (value) {
            // Handle the selection change here
          },
          items: [
            'Name',
            'Higher price',
            'Lower price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
        ),
        const SizedBox(
          height: Tsized.spaceBtwSections,
        ),
        TGridLayout(
            itemCount: 8,
            itemBuilder: (_, index) => const TProductCardVertical())
      ],
    );
  }
}
