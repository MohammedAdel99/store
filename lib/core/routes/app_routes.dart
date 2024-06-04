import 'package:store/home.dart';
import 'package:flutter/material.dart';
import 'package:store/core/routes/base_routes.dart';
import 'package:store/features/onboarding/onboarding_screen.dart';
import 'package:store/features/auth/login/presentation/screens/login_screen.dart';
import 'package:store/features/auth/signUp/presentation/screens/sign_up_screen.dart';






class AppRoutes {
  static const String home = '/homescreen';

  static const String login = '/lodin';
  static const String signup = '/signup';

  static const String onboarding = '/OnboardingScreen';
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {  
      case AppRoutes.onboarding:
        return BaseRoute(page: OnboardingScreen());

      case AppRoutes.onboarding:
        return BaseRoute(page: const OnboardingScreen());
        
      case AppRoutes.login:
        return BaseRoute(page: const LoginScreen());
      case AppRoutes.signup:  
        return BaseRoute(page: const SignUpScreen());  

      default:
        return BaseRoute(page: homescreen());
    }
  }
}
