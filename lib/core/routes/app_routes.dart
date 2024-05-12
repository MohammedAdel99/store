import 'package:store/home.dart';
import 'package:flutter/material.dart';
import 'package:store/test1_screen.dart';
import 'package:store/test2_screen.dart';
import 'package:store/core/routes/base_routes.dart';


class AppRoutes {
  static const String testOne = '/test1';
  static const String testTwo = '/test2';
  static const String home = '/homescreen';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case AppRoutes.testOne:
        return BaseRoute(page: test1());
      case AppRoutes.testTwo:
        return BaseRoute(page: test2());
      default:
        return BaseRoute(page: homescreen());
    }
  }
}
