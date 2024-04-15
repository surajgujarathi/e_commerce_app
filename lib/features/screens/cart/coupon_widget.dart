import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/theme/constants/colors.dart';
import '../../../utils/theme/constants/sizes.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
          top: Tsized.sm, bottom: Tsized.sm, right: Tsized.sm, left: Tsized.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a Promo code? Enter here',
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: dark
                          ? TColors.white.withOpacity(0.5)
                          : TColors.dark.withOpacity(0.5),
                      backgroundColor: Colors.grey.withOpacity(0.1)),
                  child: const Text('Apply')))
        ],
      ),
    );
  }
}
