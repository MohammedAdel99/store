import 'package:flutter/material.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/theming/app_theme.dart';
import 'package:store/core/sharing/env_variables.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
        title: 'Flutter Demo',
        theme:ThemeDark(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
