import 'package:e_commerce_app/common/success_screen/success_screen.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/features/screens/cart/coupon_widget.dart';
import 'package:e_commerce_app/features/screens/cart/widget/cart_items.dart';
import 'package:e_commerce_app/features/screens/checkout/widgets/billing_adress_section.dart';
import 'package:e_commerce_app/features/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_app/features/screens/checkout/widgets/billing_payement_section.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);

    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Order Review',
            style: Theme.of(context).textTheme.headlineSmall,
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: Column(
          children: [
            const TCartitems(
              showAddRemoveButton: false,
            ),
            const SizedBox(
              height: Tsized.spaceBtwInputFields,
            ),
            const TCouponCode(),
            const SizedBox(
              height: Tsized.spaceBtwSections,
            ),
            TRoundedContainer(
              padding: const EdgeInsets.all(Tsized.md),
              showBorder: true,
              backgroundColor: dark ? TColors.black : TColors.white,
              child: const Column(
                children: [
                  TBillingAmountSections(),
                  SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),
                  Divider(),
                  SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),
                  TBillingPayementSection(),
                  SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),
                  TBillingAddressSection()
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: TImages.success,
                  title: 'Payement Success',
                  subtitle: 'Your Item will be shipped soon!',
                  onpressed: () => Get.offAll(() => const NavigationMenu()),
                )),
            child: const Text('Checkout \$256.0')),
      ),
    );
  }
}
