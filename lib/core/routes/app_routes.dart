import 'package:store/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/routes/base_routes.dart';
import 'package:store/features/admin/admin_screen.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/features/customer/customer_screen.dart';
import 'package:store/features/onboarding/onboarding_screen.dart';
import 'package:store/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:store/features/auth/login/presentation/screens/login_screen.dart';
import 'package:store/features/auth/signUp/presentation/screens/sign_up_screen.dart';

class AppRoutes {
  static const String home = '/homescreen';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String onboarding = '/OnboardingScreen';
  static const String customer = 'customer';
  static const String admin = 'admin';
  static Route<void>? onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case AppRoutes.onboarding:
        return BaseRoute(page: OnboardingScreen());
      case AppRoutes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));

      case AppRoutes.signup:
        return BaseRoute(page: const SignUpScreen());
      case AppRoutes.admin:
        return BaseRoute(page: const AdminScreen());
      case AppRoutes.customer:
        return BaseRoute(page: const CustomerScreen());    

      default:
        return null;
    }
  }
}
