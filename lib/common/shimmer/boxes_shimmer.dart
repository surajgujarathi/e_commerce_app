import 'package:e_commerce_app/common/shimmer/shimmer.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/widgets.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: Tsized.spaceBtwItems,
            ),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: Tsized.spaceBtwItems,
            ),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
