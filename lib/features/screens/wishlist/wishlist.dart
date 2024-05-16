import 'package:e_commerce_app/common/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/features/controllers/product/favourites_controller.dart';
import 'package:e_commerce_app/features/screens/home/widgets/home.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/cloud_helper_functions.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationcontroller = Get.put(NavigationController());
    final controller = FavouritesController.instance;

    return Scaffold(
      //custom Appbar
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

        //product grid
        child: Obx(
          () => FutureBuilder(
            future: controller.favouriteProducts(),
            builder: (context, snapshot) {
              //Nothing Found widget
              final emptywidget = TAnimationLoaderWidget(
                text: 'oops! whishlist is empty',
                animation: TImages.lottie,
                showAction: true,
                actionText: 'Lets\'s add some',
                onActionPressed: () => navigationcontroller.selectedIndex
                    .value = (navigationcontroller.selectedIndex.value = 0),
              );

              const loader = TVerticalProductShimmer(
                itemCount: 6,
              );
              final widget = TCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                  nothingFound: emptywidget);
              if (widget != null) {
                return widget;
              }
              final products = snapshot.data!;
              return TGridLayout(
                itemCount: products.length,
                itemBuilder: (_, index) => TProductCardVertical(
                  product: products[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
