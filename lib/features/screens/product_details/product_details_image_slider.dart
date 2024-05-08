import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/favourite_icon/favourite_icon.dart';
import 'package:e_commerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/features/controllers/product/images_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../utils/theme/constants/colors.dart';
import '../../../utils/theme/constants/sizes.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);

    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          //Main large image
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(Tsized.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImages(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: TColors.primary,
                        ),
                      ),
                    );
                  })),
                )),

            //Image slider

            Positioned(
              right: 0,
              bottom: 30,
              left: Tsized.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(
                    width: Tsized.spaceBtwItems,
                  ),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectProductImage.value == images[index];
                    return TRoundedImage(
                        isNetworkimage: true,
                        width: 80,
                        backgroundcolor: dark ? TColors.dark : TColors.white,
                        onpressed: () =>
                            controller.selectProductImage.value = images[index],
                        border: Border.all(
                            color: imageSelected
                                ? TColors.primary
                                : Colors.transparent),
                        padding: const EdgeInsets.all(Tsized.sm),
                        imageurl: images[index]);
                  }),
                ),
              ),
            ),

            //Appbar Icons
            TAppBar(
              showBackArrow: true,
              actions: [
                TFavouriteIcon(
                  productId: product.id,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
