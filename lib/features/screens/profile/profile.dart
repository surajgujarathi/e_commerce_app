import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/controllers/user_controller.dart';

import 'package:e_commerce_app/features/screens/profile/profile_menu.dart';
import 'package:e_commerce_app/common/shimmer/shimmer.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'changename.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
              Obx(() {
                final networkImage = controller.user.value.profilePicture;
                final image =
                    networkImage.isNotEmpty ? networkImage : TImages.profile;

                return controller.imageUploading.value
                    ? const TShimmerEffect(
                        width: 80,
                        height: 80,
                        radius: 80,
                      )
                    : TCircularImage(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImage.isNotEmpty);
              }),
              TextButton(
                  onPressed: () => controller.uploadUserProfilePicture(),
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
                onPressed: () => Get.off(() => const ChangeName()),
                value: controller.user.value.fullName,
                title: 'Name',
              ),
              TProfileMenu(
                onPressed: () {},
                value: controller.user.value.username,
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
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                onPressed: () {},
                title: ' E-mail',
                value: controller.user.value.email,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'PhoneNumber',
                value: controller.user.value.phoneNumber,
              ),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'male'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Date of birth',
                  value: '08-09-1999'),
              const SizedBox(height: Tsized.spaceBtwItems),
              const Divider(),
              TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
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
