import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/screens/profile/profile_menu.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              TCircularImage(
                image: TImages.profile,
                width: 80,
                height: 80,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text('Change Profile Picture')),
              const SizedBox(height: Tsized.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: Tsized.spaceBtwItems),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButtton: false,
              ),
              const SizedBox(height: Tsized.spaceBtwItems),
              TProfileMenu(
                onPressed: () {},
                value: 'Suraj Gujarathi',
                title: 'Name',
              ),
              TProfileMenu(
                onPressed: () {},
                value: 'Suraj9999',
                title: 'UserName',
              ),
              const SizedBox(height: Tsized.spaceBtwItems),
              const Divider(),
              const SizedBox(height: Tsized.spaceBtwItems),
              const TSectionHeading(
                title: 'Personal information',
                showActionButtton: false,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Usere id',
                value: '4556789',
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                  onPressed: () {}, title: ' E-mail', value: 'suraj9999'),
              TProfileMenu(
                  onPressed: () {}, title: 'PhoneNumber', value: '9987654321'),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'male'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Date of birth',
                  value: '08-09-1999'),
              const SizedBox(height: Tsized.spaceBtwItems),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
