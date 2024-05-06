import 'dart:io';
import 'store_app.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'core/sharing/env_variables.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvVariable.instance.init(envType: EnvTypeEnum.prod);

  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDBXAt18E-tcFaQKZieJRRNAM4aM6D2E9M",
              appId: "1:562037944014:android:cc6c5c2fbebab9d4e56a9f",
              messagingSenderId: "562037944014",
              projectId: "store-5df85"))
      : await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(const StoreApp());
  });
}
