import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/screens/address/address_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseAuth.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authuser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information.Try again in few minutes';
      }

      final result =
          await _db.collection('Users').doc(userId).collection('Address').get();
      return result.docs
          .map((documentSnapshot) =>
              AddressModel.fromDocumentSnapshot(documentSnapshot))
          .tolist();
    } catch (e) {
      throw 'Something went wrong while fetching address information.Try again later';
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {} catch (e) {
      throw 'Unable to Update your address selction .try again later';
    }
  }
}
