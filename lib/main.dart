import 'dart:io';
import 'package:store/store_app.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:store/core/sharing/env_variables.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/networking/api_observer.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvVariable.instance.init(envType: EnvTypeEnum.prod);

  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyDBXAt18E-tcFaQKZieJRRNAM4aM6D2E9M',
            appId: '1:562037944014:android:cc6c5c2fbebab9d4e56a9f',
            messagingSenderId: '562037944014',
            projectId: 'store-5df85',
          ),
        )
      : await Firebase.initializeApp();
  await SharedPref().instantiatePreferences();
  await setupInjector();
  Bloc.observer = AppCubitObserver();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const StoreApp());
  });
}
