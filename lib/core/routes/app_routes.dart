import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/routes/base_routes.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/features/customer/customer_screen.dart';
import 'package:store/features/onboarding/onboarding_screen.dart';
import 'package:store/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:store/features/auth/signUp/logic/cubit/signup_cubit.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/auth/login/presentation/screens/login_screen.dart';
import 'package:store/features/auth/signUp/presentation/screens/sign_up_screen.dart';
import 'package:store/features/admin/home_admin/presentation/screens/home_admin_screen.dart';






class AppRoutes {
  static const String home = 'home';
  static const String signup = 'signup';
  static const String login = 'login';
  static const String onboarding = 'onboarding';
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
        return MaterialPageRoute(
            builder: (_) => 
            MultiBlocProvider(providers: [
            BlocProvider(create: (context) => getIt<UploadImageCubit>()),
            BlocProvider(create: (context) =>  getIt<SignupCubit>()),
            BlocProvider(create: (context) =>  getIt<LoginCubit>())
            ], child: 
            const SignUpScreen(),
                ));
      case AppRoutes.admin:
        return  BaseRoute(page: const  HomeAdminScreen());
      case AppRoutes.customer:
        return BaseRoute(page: const CustomerScreen());  
     

      default:
        return null;
    }
  }
}
