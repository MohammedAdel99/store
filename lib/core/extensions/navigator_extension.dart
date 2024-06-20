import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/extensions/color_extension.dart';
import 'package:store/core/extensions/image_extension.dart';
import 'package:store/core/localization/app_localizations.dart';
import 'package:store/features/auth/login/logic/cubit/login_cubit.dart';


extension Navigation on BuildContext {
   //Todo: color
  MyColors get color => Theme.of(this).extension<MyColors>()!;
  //Todo: images
  MyAssets get assets => Theme.of(this).extension<MyAssets>()!;
  //Todo: style
    TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;

  //Todo:Localization
  String translate(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }
  //Todo: navigator
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveutil(
    String routeName, {
    required RoutePredicate predicate,
    Object? arguments,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();



}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}
