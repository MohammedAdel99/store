import 'package:flutter/material.dart';
import 'package:store/core/extensions/color_extension.dart';
import 'package:store/core/extensions/image_extension.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/theming/colors/colors.light.dart';
import 'package:store/core/helpers/fonts/font_family_helper.dart';


ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark, MyAssets.dark],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.white,
        fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.light, MyAssets.light],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsLight.black,
        fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      ),
    ),
  );
}