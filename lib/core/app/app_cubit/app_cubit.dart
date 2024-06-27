import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_keys.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_helper.dart';


part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(dio) : super(const AppState.initial());

  bool isDark = true;
  String currantLang = 'en';

// Todos: Theme
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref.setBool(SharedPrefKeys.themeMode, isDark).then((value) {
        emit(AppState.themeChangeMode(isDark: isDark));
      });
    }
  }

// Todos: Language
  void getSavedLanguage() {
    final result = SharedPref.containPreference(SharedPrefKeys.language)
        ? SharedPref.getString(SharedPrefKeys.language)
        : 'en';
    currantLang = result!;
    emit(AppState.languageChange(locale: Locale(currantLang)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPref.setString(SharedPrefKeys.language, langCode);
    currantLang = langCode;
    emit(AppState.languageChange(locale: Locale(currantLang)));
  }

  void toArabic() => _changeLang('ar');
  void toEnglish() => _changeLang('en');
}
