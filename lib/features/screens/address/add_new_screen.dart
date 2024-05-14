import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/controllers/address_controller.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AddNewAdressScreen extends StatelessWidget {
  const AddNewAdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Add new adress'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: Form(
          key: controller.adressFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: controller.name,
                    validator: (value) =>
                        TValidator.validateEmptyText('Name', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.user,
                        ),
                        labelText: 'Name'),
                  ),
                  const SizedBox(height: Tsized.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.phoneNumber,
                    validator: TValidator.validatePhoneNumber,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.mobile,
                        ),
                        labelText: 'mobile'),
                  ),
                  const SizedBox(height: Tsized.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.street,
                          validator: (value) =>
                              TValidator.validateEmptyText('Street', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.building_3,
                              ),
                              labelText: 'Street'),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.postalCode,
                          validator: (value) => TValidator.validateEmptyText(
                              'Postal Code', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.code,
                              ),
                              labelText: 'Postal code'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Tsized.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.city,
                          validator: (value) =>
                              TValidator.validateEmptyText('City', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.building,
                              ),
                              labelText: 'City'),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.state,
                          validator: (value) =>
                              TValidator.validateEmptyText('State', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.code,
                              ),
                              labelText: 'State'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Tsized.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.country,
                    validator: (value) =>
                        TValidator.validateEmptyText('Country', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                  ),
                  const SizedBox(height: Tsized.defaultSpace),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.addNewAddresses(),
                        child: const Text('Save')),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
