import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/screens/address/address_model.dart';

import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

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
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching address information.Try again later';
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authuser!.uid;
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Address')
          .doc(addressId)
          .update({'SelectedAddress': selected});
    } catch (e) {
      throw 'Unable to Update your address selction .try again later';
    }
  }

  //store new user order
  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authuser!.uid;
      final currentAddress = await _db
          .collection('Users')
          .doc(userId)
          .collection('Address')
          .add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong while saving adress information.try agian later';
    }
  }
}
