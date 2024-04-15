
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TsingleAddress extends StatelessWidget {
  const TsingleAddress({super.key, required this.selectedAdress});
  final bool selectedAdress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return TRoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(Tsized.md),
      showBorder: true,
      backgroundColor: selectedAdress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAdress
          ? Colors.transparent
          : dark
              ? TColors.darkGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: Tsized.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAdress ? Iconsax.tick_circle : null,
              color: selectedAdress
                  ? dark
                      ? TColors.light
                      : TColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Suraj Gujarathi',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: Tsized.sm / 2,
              ),
              const Text(
                '(+123) 456 7890',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: Tsized.sm / 2,
              ),
              const Text(
                '82356 Suraj gujarathi,South lane,87566,USA',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
