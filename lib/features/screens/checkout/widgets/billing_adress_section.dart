import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../utils/theme/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text('Suraj Gujarathi', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(
          height: Tsized.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: Tsized.spaceBtwItems / 2,
            ),
            Text(
              '+91 9848274196',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: Tsized.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: Tsized.spaceBtwItems / 2,
            ),
            Expanded(
              child: Text(
                'Husnabad Street Armoor,India',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            )
          ],
        ),
      ],
    );
  }
}
