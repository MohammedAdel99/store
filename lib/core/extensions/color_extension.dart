import 'package:flutter/material.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/theming/colors/colors.light.dart';




class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.mainColor,
    required this.bluePinkDark,
    required this.bluePinkLight,
    required this.textColor,
    required this.textFormBorder,
    required this.navBarbg,
    required this.navBarSelectedTab,
    required this.containerShadow1,
    required this.containerShadow2,
    required this.containerLinear1,
    required this.containerLinear2,
    required this.shimmer,
  });

  final Color? mainColor;
  final Color? bluePinkDark;
  final Color? bluePinkLight;
  final Color? textColor;
  final Color? textFormBorder;
  final Color? navBarbg;
  final Color? navBarSelectedTab;
  final Color? containerShadow1;
  final Color? containerShadow2;
  final Color? containerLinear1;
  final Color? containerLinear2;
  final Color? shimmer;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? mainColor,
    Color? bluePinkDark,
    Color? bluePinkLight,
    Color? textColor,
    Color? textFormBorder,
    Color? navBarbg,
    Color? navBarSelectedTab,
    Color? containerShadow1,
    Color? containerShadow2,
    Color? containerLinear1,
    Color? shimmer
  }) {
    return MyColors(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
      bluePinkLight: bluePinkLight,
      textColor: textColor,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
      shimmer:shimmer
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
      bluePinkLight: bluePinkLight,
      textColor: textColor,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
      shimmer: shimmer
    );
  }

  static const MyColors dark = MyColors(
    mainColor: ColorsDark.mainColor,
    bluePinkDark: ColorsDark.blueDark,
    bluePinkLight: ColorsDark.blueLight,
    textColor: ColorsDark.white,
    textFormBorder: ColorsDark.white,
    navBarbg: ColorsDark.navBarDark,
    navBarSelectedTab: ColorsDark.white,
    containerShadow1: ColorsDark.black1,
    containerShadow2: ColorsDark.black2,
    containerLinear1: ColorsDark.black1,
    containerLinear2: ColorsDark.black2,
    shimmer: ColorsDark.grey
  );

  static const MyColors light = MyColors(
    mainColor: ColorsLight.mainColor,
    bluePinkDark: ColorsLight.pinkDark,
    bluePinkLight: ColorsLight.pinkLight,
    textColor: ColorsLight.black,
    textFormBorder: ColorsLight.black,
    navBarbg: ColorsLight.mainColor,
    navBarSelectedTab: ColorsLight.pinkDark,
    containerShadow1: ColorsLight.grey,
    containerShadow2: ColorsLight.white,
    containerLinear1: ColorsLight.pinkDark,
    containerLinear2: ColorsLight.pinkLight,
    shimmer: ColorsLight.grey
  );
}
