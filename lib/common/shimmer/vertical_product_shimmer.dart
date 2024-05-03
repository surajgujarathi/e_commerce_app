import 'package:e_commerce_app/common/shimmer/shimmer.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/widgets.dart';

import '../widgets/layouts/grid_layout.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image

            TShimmerEffect(width: 180, height: 180),
            SizedBox(height: Tsized.spaceBtwItems),

            /// Text

            TShimmerEffect(width: 160, height: 15),
            SizedBox(height: Tsized.spaceBtwItems / 2),
            TShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
