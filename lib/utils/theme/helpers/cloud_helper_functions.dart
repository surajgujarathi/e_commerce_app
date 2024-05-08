import 'package:e_commerce_app/common/shimmer/vertical_product_shimmer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TCloudHelperFunctions {
  //helper function to check the state of a single database record
  //returns a widget based on the state of the snapshot
  //id data is still loading ,it returns a circularprogressindicator

  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(
        child: Text('No data Found'),
      );
    }
    if (snapshot.hasError) {
      return const Center(
        child: Text('Something went wrong'),
      );
    }
    return null;
  }

  static Widget? checkMultiRecordState<T>({
    required AsyncSnapshot<List<T>> snapshot,
    Widget? loader,
    Widget? error,
    Widget? nothingFound,
  }) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (nothingFound != null) return nothingFound;
      return const Center(
        child: Text('No data Found'),
      );
    }
    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(
        child: Text('Something went wrong'),
      );
    }
    return null;
  }

  //create a reference with an intial file path and name and retrive the download URL
  static Future<String> getURLFromPathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw 'Something Went Wrong';
    }
  }
}
