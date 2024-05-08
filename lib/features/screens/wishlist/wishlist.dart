import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/features/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/screens/home/widgets/home.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      appBar: TAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            color: THelperFunctions.isDarkmode(context)
                ? TColors.white
                : TColors.black,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: Column(
          children: [
            TGridLayout(
              itemCount: controller.featuredProducts.length,
              itemBuilder: (_, index) => TProductCardVertical(
                product: controller.featuredProducts[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
