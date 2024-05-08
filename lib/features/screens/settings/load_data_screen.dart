import 'package:e_commerce_app/data/categories/categories_repository.dart';
import 'package:e_commerce_app/data/repositories.authentication/product_repositories.dart';
import 'package:e_commerce_app/features/banners/banner_repository.dart';
import 'package:e_commerce_app/features/screens/brand/brand_repositories.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/categories/dummy_data.dart';

class UploadImageToFirebase extends StatelessWidget {
  UploadImageToFirebase({super.key});
  final mycontroller = CategoryRepository.instance;
  final bannerController = BannerRepository.instance;
  final productController = ProductRepository.instance;
  final brandController = Get.put(BrandRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Data'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Main Record',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.all(Tsized.spaceBtwItems),
                child: Column(
                  children: [
                    UplaodDataTile(
                      icon1: Icons.category,
                      text: 'Upload Categories',
                      ontap: () =>
                          mycontroller.uploadDummyData(TDummyData.categories),
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwItems,
                    ),
                    UplaodDataTile(
                      icon1: Icons.storefront_outlined,
                      text: 'Upload brands',
                      ontap: () =>
                          brandController.uploadBrandData(TDummyData.brands),
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwItems,
                    ),
                    UplaodDataTile(
                        icon1: Icons.shopping_cart_outlined,
                        text: 'Upload Products',
                        ontap: () => productController
                            .uploadProductData(TDummyData.products)),
                    const SizedBox(
                      height: Tsized.spaceBtwItems,
                    ),
                    UplaodDataTile(
                      icon1: Icons.category,
                      text: 'Upload Banners',
                      ontap: () =>
                          bannerController.uploadBannerData(TDummyData.banners),
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwItems,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              Text(
                'Relationships',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Make sure you have already uploaded all the content above',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: Colors.black),
              ),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              Padding(
                padding: const EdgeInsets.all(Tsized.spaceBtwItems),
                child: Column(
                  children: [
                    UplaodDataTile(
                      icon1: Icons.insert_link_sharp,
                      text: 'Upload Brands & \nCategories Relation Data',
                      ontap: () {},
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwItems,
                    ),
                    UplaodDataTile(
                      icon1: Icons.insert_link_sharp,
                      text: 'Upload products \nCategories Relation Data',
                      ontap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UplaodDataTile extends StatelessWidget {
  const UplaodDataTile({
    super.key,
    required this.text,
    required this.icon1,
    required this.ontap,
  });

  final String text;
  final IconData icon1;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon1,
          size: 30,
          color: const Color.fromARGB(255, 63, 72, 141),
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        const Spacer(
          flex: 6,
        ),
        IconButton(
            onPressed: ontap,
            icon: const Icon(
              Icons.upload,
              color: Color.fromARGB(255, 63, 72, 141),
            ))
      ],
    );
  }
}
