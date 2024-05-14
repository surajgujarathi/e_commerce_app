import 'package:e_commerce_app/features/screens/address/address_model.dart';
import 'package:e_commerce_app/features/screens/address/address_repository.dart';
import 'package:e_commerce_app/loaders.dart';
import 'package:e_commerce_app/network_manager.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();

  final postalCode = TextEditingController();
  final city = TextEditingController();

  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> adressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
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
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: CircularProgressIndicator(),
      );

      //clear the 'selected' field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      //asign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      //set the selected field to true for the newly selcted address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error in selction', message: e.toString());
    }
  }

//Add new Address
  Future addNewAddresses() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Storing Addresss...', TImages.lottie);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stoploading();
        return;
      }

      //Form validation
      if (!adressFormKey.currentState!.validate()) {
        TFullScreenLoader.stoploading();
        return;
      }

      //save address data
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true);
      final id = await addressRepository.addAddress(address);

      //update selcted adress status
      address.id = id;
      selectedAddress(address);

      //remove loader
      TFullScreenLoader.stoploading();

      //show access message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your Adress has been saved successfully');

      //refresh addresses data
      refreshData.toggle();

      //reset fields
      resetFormFields();

      //redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      //remove loader
      TFullScreenLoader.stoploading();
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

//function to reset form fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();

    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    adressFormKey.currentState?.reset();
  }
}
