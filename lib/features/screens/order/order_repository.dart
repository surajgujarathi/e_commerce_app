import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories.authentication/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //----------Functions----------//
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authuser.uid;
      if (userId.isEmpty)
        throw 'Unable to find user informations.Try again in few minutes';

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong whilen fetching order information.Try again later';
    }
  }

  //Store new user order

  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw 'Something went wrong whilen saving order information.Try again later';
    }
  }
}
