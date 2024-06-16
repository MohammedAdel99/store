import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/theming/app_theme.dart';
import 'package:store/core/networking/constants.dart';
import 'package:store/core/sharing/env_variables.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/networking/app_cubit/app_cubit.dart';
import 'package:store/core/localization/app_localizations_setup.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_keys.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_helper.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppCubit>()
        ..changeAppThemeMode(
            sharedMode: SharedPref.getBool(SharedPrefKeys.themeMode),)
        ..getSavedLanguage(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: BlocBuilder<AppCubit, AppState>(
          buildWhen: ((previous, current) {
            return previous != current;
          }),
          builder: (context, state) {
            final cubit = context.read<AppCubit>();
            return MaterialApp(
              debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
              title: 'Flutter Demo',
              theme:cubit.isDark?  themeDark() : themeLight(),
              locale: Locale(cubit.currantLang),
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              initialRoute: AppRoutes.onboarding,    
              
              
              
             
            );
          },
        ),
      ),
    );
  }
}
