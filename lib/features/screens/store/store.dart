import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/appbar/t_tabbar.dart';
import 'package:e_commerce_app/common/widgets/categories_tab.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/searchcontainer.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products.cart/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/brands/t_brand_card.dart';
import 'package:e_commerce_app/features/controllers/category_controller.dart';
import 'package:e_commerce_app/features/screens/brand/all_brands.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
          //backgroundColor: Colors.amber,
          appBar: TAppBar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              TCartCounterIcon(
                onPressed: () {},
                // iconColor: Colors.black,
              )
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoXIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkmode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(Tsized.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const TSearchContainer(
                          text: 'Search in store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: Tsized.spaceBtwSections,
                        ),
                        TSectionHeading(
                          title: 'Feature Brands',
                          showActionButtton: true,
                          onPressed: () => Get.to(() => const AllBrandScreen()),
                        ),
                        const SizedBox(
                          height: Tsized.spaceBtwItems / 1.5,
                        ),
                        //brands grid
                        TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const TBrandCard(
                                showborder: true,
                              );
                            })
                      ],
                    ),
                  ),
                  //tabs
                  bottom: TTabBar(
                      tabs: categories
                          .map((category) => Tab(child: Text(category.name)))
                          .toList()),
                ),
              ];
            },
            body: TabBarView(
                children: categories
                    .map((Category) => Tcategorytab(
                          category: Category,
                        ))
                    .toList()),
          )),
    );
  }
}
