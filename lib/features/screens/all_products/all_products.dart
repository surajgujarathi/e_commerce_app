import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/common/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/screens/sortable/sortable_products.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product/all_product_controller.dart';

class Allproducts extends StatelessWidget {
  const Allproducts(
      {super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    //Intialize controller for managing product fetching
    final controller = Get.put(AllProductsController());
    return Scaffold(
      //appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: FutureBuilder(
          future: futureMethod ?? controller.fetchProductsByQuery(query),
          builder: (context, snapshot) {
            //check the state of the FutureBuilder snapshot
            const loader = TVerticalProductShimmer();
            final widget = TCloudHelperFunctions.checkMultiRecordState(
                snapshot: snapshot, loader: loader);

            //return appropriate widget based on snapshot state
            if (widget != null) return widget;

            //Products found!
            final products = snapshot.data!;

            return TSortableProducts(products: products);
          },
        ),
      ),
    );
  }
}
