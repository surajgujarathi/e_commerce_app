import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AddNewAdressScreen extends StatelessWidget {
  const AddNewAdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Add new adress'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: Form(
          child: Column(
            children: [
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.user,
                        ),
                        labelText: 'Name'),
                  ),
                  const SizedBox(height: Tsized.spaceBtwInputFields),
                  TextFormField(
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
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.building_3,
                              ),
                              labelText: 'Street'),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
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
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.building,
                              ),
                              labelText: 'City'),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
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
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                  ),
                  const SizedBox(height: Tsized.defaultSpace),
                  SizedBox(
                    width: double.infinity,
                    child:
                        ElevatedButton(onPressed: () {}, child: const Text('Save')),
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
