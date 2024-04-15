import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/screens/address/add_new_screen.dart';
import 'package:e_commerce_app/features/screens/address/widgets/single_adresses.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          () => const AddNewAdressScreen(),
        ),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            children: [
              TsingleAddress(
                selectedAdress: true,
              ),
              TsingleAddress(
                selectedAdress: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
