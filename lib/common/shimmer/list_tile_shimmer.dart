import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/widgets.dart';

import 'shimmer.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(
              width: 50,
              height: 50,
              radius: 50,
            ),
            SizedBox(
              width: Tsized.spaceBtwItems,
            ),
            Column(
              children: [
                TShimmerEffect(
                  width: 100,
                  height: 15,
                ),
                SizedBox(
                  width: Tsized.spaceBtwItems / 2,
                ),
                TShimmerEffect(
                  width: 80,
                  height: 12,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
