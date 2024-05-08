import 'package:e_commerce_app/app.dart';
import 'package:e_commerce_app/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  //Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //--GetX Local storage
  await GetStorage.init();

  //Await Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //--Intialize firebase and authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

//Load all the Material design/themes/localizations/bindings
  runApp(const MyApp());
}
