import 'package:e_commerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce_app/features/controllers/product/favourites_controller.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => TCircularIcon(
        icon: controller.isFavourite(productId)
            ? Iconsax.heart
            : Icons
                .favorite_border_outlined, // Use different icons for favorited and non-favorited states
        color: controller.isFavourite(productId)
            ? TColors.error
            : null, // Change color for favorited state
        onPressed: () => controller.toggleFavourite(productId),
      ),
    );
  }
}
