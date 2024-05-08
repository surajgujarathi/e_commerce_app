import 'package:e_commerce_app/common/shimmer/shimmer.dart';
import 'package:flutter/widgets.dart';

import '../widgets/layouts/grid_layout.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (_, __) => const TShimmerEffect(width: 300, height: 80));
  }
}
