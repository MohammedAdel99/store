import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_keys.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_helper.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      addDioHeader();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeader() async {
    dio?.options.headers = {
      'Authorization':
          'Bearer ${await SharedPref.getString(SharedPrefKeys.userToken)}',
    };
  }

  static void setTokenAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
