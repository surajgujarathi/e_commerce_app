import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/features/screens/order/order_controller.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/cloud_helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/theme/helpers/helpers_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    // ignore: unused_local_variable
    final dark = THelperFunctions.isDarkmode(context);
    return FutureBuilder(
        future: controller.fetchUsersOrders(),
        builder: (context, snapshot) {
          //nothing found widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! No order Yet!',
            animation: TImages.lottie,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          //helper function :handle loader ,no record ,or error messgae
          final response = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          //congratulations record found
          final orders = snapshot.data!;
          return ListView.separated(
              shrinkWrap: true,
              itemCount: orders.length,
              separatorBuilder: (_, __) => const SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),
              itemBuilder: (_, index) {
                final order = orders[index];
                return TRoundedContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(Tsized.md),
                    backgroundColor: THelperFunctions.isDarkmode(context)
                        ? TColors.dark
                        : TColors.light,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //row1
                        Row(
                          children: [
                            //1. icon
                            const Icon(Iconsax.ship),
                            const SizedBox(
                              width: Tsized.spaceBtwItems / 2,
                            ),
                            //2. status and date
                            Expanded(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order.orderStatusText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                              color: TColors.primary,
                                              fontWeightDelta: 1),
                                    ),
                                    Text(order.formattedOrderDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                  ]),
                            ),
                            //3. icon
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.arrow_right_3,
                                  size: Tsized.iconSm,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: Tsized.spaceBtwItems,
                        ),
                        //row2
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  //1. icon
                                  const Icon(Iconsax.ship),
                                  const SizedBox(
                                    width: Tsized.spaceBtwItems / 2,
                                  ),
                                  //2. status and date
                                  Expanded(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Order',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium),
                                          Text(order.id,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  //1. icon
                                  const Icon(Iconsax.calendar),
                                  const SizedBox(
                                    width: Tsized.spaceBtwItems / 2,
                                  ),

                                  //2. status and date
                                  Flexible(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Shipping Date',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium),
                                          Text(order.formattedDeliveryDate,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
              });
        });
  }
}
