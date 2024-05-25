import 'package:store/home.dart';
import 'package:flutter/material.dart';
import 'package:store/test1_screen.dart';
import 'package:store/core/routes/base_routes.dart';
import 'package:store/features/onboarding/onboarding_screen.dart';




class AppRoutes {
  static const String testOne = '/test1';
  static const String testTwo = '/test2';
  static const String home = '/homescreen';
  static const String onboarding = '/onboardingscreen';
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case AppRoutes.testOne:
        return BaseRoute(page: test1());
      case AppRoutes.onboarding:
        return BaseRoute(page: onboardingscreen());
      default:
        return BaseRoute(page: homescreen());
    }
  }
}
