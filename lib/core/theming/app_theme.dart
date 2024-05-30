import 'package:flutter/material.dart';
import 'package:store/core/theming/color_extension.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/theming/colors/colors.light.dart';

ThemeData ThemeDark() {
  return ThemeData(
    
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark],
    useMaterial3: true,
     textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.textColor,)),
  );
}

ThemeData ThemeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.light],
    useMaterial3: true,
     textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsLight.textColor,),),
  );
}
