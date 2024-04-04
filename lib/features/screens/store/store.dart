import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/searchcontainer.dart';
import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/common/widgets/product_cards/products_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/products.cart/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/enums.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.amber,
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              // iconColor: Colors.black,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoXIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkmode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(Tsized.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const TSearchContainer(
                        text: 'Search in store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: Tsized.spaceBtwSections,
                      ),
                      TSectionHeading(
                        title: 'Feature Brands',
                        showActionButtton: true,
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: Tsized.spaceBtwItems / 1.5,
                      ),
                      TRoundedContainer(
                        padding: const EdgeInsets.all(Tsized.xs),
                        showBorder: false,
                        backgroundColor: Colors.transparent,
                        child: Row(
                          children: [
                            TCircularImage(
                              isNetworkImage: false,
                              backgroundColor: Colors.transparent,
                              overlaycolor: THelperFunctions.isDarkmode(context)
                                  ? TColors.white
                                  : TColors.black,
                              image: TImages.product1,
                            ),
                            const SizedBox(
                              height: Tsized.spaceBtwItems / 2,
                            ),
                            // Column(
                            //   children: [
                            //     TBrandTitleWithVerifiedIcon(
                            //       title: 'Nike',
                            //       brandTextSize: Textsizes.large,
                            //     )
                            //   ],
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container(),
        ));
  }
}
