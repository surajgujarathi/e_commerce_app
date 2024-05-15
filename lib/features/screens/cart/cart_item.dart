import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand__verified_icon.dart';
import 'package:e_commerce_app/features/screens/cart/cart_item_model.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/images/t_rounded_image.dart';
import '../../../utils/theme/constants/colors.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Row(
      children: [
        //image
        TRoundedImage(
          imageurl: cartItem.image ?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(Tsized.sm),
          backgroundcolor: THelperFunctions.isDarkmode(context)
              ? TColors.darkerGrey
              : TColors.light,
          isNetworkimage: true,
        ),
        const SizedBox(
          height: Tsized.spaceBtwItems,
        ),

        //Title, price and size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(
                  textcolor: dark ? TColors.white : TColors.darkGrey,
                  title: cartItem.brandName ?? ''),
              Flexible(
                child: TProductTitleText(title: cartItem.title, maxLines: 1),
              ),

              //attributes
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {}).entries.map((e) {
                    return TextSpan(
                      children: [
                        TextSpan(
                          text: e.key,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: e.value,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
