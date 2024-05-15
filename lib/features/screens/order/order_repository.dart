import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/screens/order/order_Model.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //----------Functions----------//
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final authUser = AuthenticationRepository.instance.authuser;
      if (authUser == null || authUser.uid.isEmpty) {
        throw 'Unable to find user information. Try again later.';
      }

      final userId = authUser.uid;

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();

      // Map document snapshots to OrderModel instances
      final orders = result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();

      return orders;
    } catch (e) {
      throw 'Failed to fetch order information: $e';
    }
  }

  //Store new user order

  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.tojson());
    } catch (e) {
      throw 'Something went wrong whilen saving order information.Try again later';
    }
  }
}
