import 'package:e_commerce_app/common/shimmer/shimmer.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryshimmer extends StatelessWidget {
  const TCategoryshimmer({this.itemCount = 6, super.key});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>
              const SizedBox(width: Tsized.spaceBtwItems),
          itemCount: itemCount,
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image
                TShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(height: Tsized.spaceBtwItems / 2),

                //Text
                TShimmerEffect(width: 55, height: 8),
              ],
            );
          }),
    );
  }
}
