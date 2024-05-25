import 'package:flutter/material.dart';
import 'package:store/core/sharing/env_variables.dart';
class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return MaterialApp(
      debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
=======
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
        title: 'Flutter Demo',
<<<<<<< Updated upstream
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('My Store')),
          ),
        ),
=======
        theme:ThemeDark(),
        locale:const Locale('en') ,
        supportedLocales:AppLocalizationsSetup.supportedLocales ,
        localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
        localizationsDelegates:AppLocalizationsSetup.localizationsDelegates ,

        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: AppRoutes.home,
>>>>>>> Stashed changes
>>>>>>> Stashed changes
      ),
      home: Scaffold(
        appBar:AppBar(
        title:Center(child:Text('My Store')))),
    );
  }
}
