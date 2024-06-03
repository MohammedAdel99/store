import 'package:store/home.dart';
import 'package:flutter/material.dart';
import 'package:store/core/routes/base_routes.dart';
import 'package:store/features/onboarding/onboarding_screen.dart';
import 'package:store/features/auth/login/presentation/screens/login_screen.dart';
<<<<<<< Updated upstream





class AppRoutes {
  static const String home = '/homescreen';
=======

class AppRoutes {
  static const String login = '/lodin';
>>>>>>> Stashed changes
  static const String onboarding = '/OnboardingScreen';
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
<<<<<<< Updated upstream
      
      case AppRoutes.onboarding:
        return BaseRoute(page: OnboardingScreen());
=======
      case AppRoutes.onboarding:
        return BaseRoute(page: const OnboardingScreen());
        
      case AppRoutes.login:
        return BaseRoute(page: const LoginScreen());
>>>>>>> Stashed changes
      default:
        return BaseRoute(page: homescreen());
    }
  }
}
}