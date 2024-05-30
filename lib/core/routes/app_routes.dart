import 'package:store/home.dart';
import 'package:flutter/material.dart';
import 'package:store/core/routes/base_routes.dart';
import 'package:store/features/onboarding/onboarding_screen.dart';





class AppRoutes {
  static const String home = '/homescreen';
  static const String onboarding = '/OnboardingScreen';
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      
      case AppRoutes.onboarding:
        return BaseRoute(page: OnboardingScreen());
      default:
        return BaseRoute(page: homescreen());
    }
  }
}
