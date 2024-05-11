import 'package:flutter/material.dart';
import 'package:store/core/sharing/env_variables.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/font_family_helper.dart';
import 'package:store/core/theming/font_weight_helper.dart';


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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Brand Store',
                 style: TextStyle(
                  fontSize: 20 , fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight:FontWeightHelper.bold, ),),
                SizedBox(width: 20),
                Text('براند ستور',
                  style: TextStyle(
                    fontSize: 20 ,
                     fontFamily: FontFamilyHelper.cairoArabic,
                    fontWeight:FontWeightHelper.bold,),),
              ],
            ),),
          ),
        ),
      ),
    );
  }
}
