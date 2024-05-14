import 'package:e_commerce_app/features/screens/address/address_model.dart';
import 'package:e_commerce_app/features/screens/address/address_repository.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  final addressRepository = Get.put(AddressRepository());

  //Fetch all user specific address
  Future<List<AddressModel>> getallUserAddress() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());

      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      //clear the 'selected' field
      if (selectedAddress.value.id.isNotEmpty) {}

      //asign selected address
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error in selction', message: e.toString());
    }
  }
}
