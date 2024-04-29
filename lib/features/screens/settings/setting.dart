import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/screens/address/address.dart';
import 'package:e_commerce_app/features/screens/list_tiles/setting_menu_tiles.dart';
import 'package:e_commerce_app/features/screens/login/widgets/login.dart';
import 'package:e_commerce_app/features/screens/order/order.dart';
import 'package:e_commerce_app/features/screens/settings/load_data_screen.dart';
import 'package:e_commerce_app/features/screens/settings/t_user_profile.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../profile/profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const SizedBox(
                  height: Tsized.spaceBtwInputFields,
                ),
                TUserProfile(
                  onPressed: () => Get.to(() => const ProfileScreen()),
                ),
                const SizedBox(
                  height: Tsized.spaceBtwSections,
                ),
              ],
            )),
            //Body
            Padding(
              padding: const EdgeInsets.all(Tsized.defaultSpace),
              child: Column(
                //acount setting
                children: [
                  const TSectionHeading(
                    title: 'Acoount Settings',
                    showActionButtton: false,
                  ),
                  const SizedBox(height: Tsized.spaceBtwItems),
                  TsettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Adresses',
                    subtitle: 'Set Shopping delivery adress',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add,remove products and move to checkout',
                    onTap: () {},
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In Progress and completed Orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Accounts',
                    subtitle: 'Withdraw balance to registered bank accounts',
                    onTap: () {},
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupuons',
                    subtitle: 'List of all the dicount coupons',
                    onTap: () {},
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Accounts Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),
                  const SizedBox(height: Tsized.spaceBtwSections),
                  const TSectionHeading(
                      title: 'App settings', showActionButtton: false),
                  const SizedBox(height: Tsized.spaceBtwItems),
                  TsettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'load data',
                    subtitle: 'Upload data to ur cloud firebase',
                    onTap: () => Get.to(() => UploadImageToFirebase()),
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendations based on locations',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safemode',
                    subtitle: 'Seach result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD image quality',
                    subtitle: 'Set image quality to be seen ',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  //logout button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => Get.offAll(() => const LoginScreen()),
                        child: const Text('Logout')),
                  ),
                  const SizedBox(
                    height: Tsized.spaceBtwSections * 2.5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
