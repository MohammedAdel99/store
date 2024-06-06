import 'package:store/core/helpers/shared_pref/shared_pref_keys.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_helper.dart';

class FontFamilyHelper {
  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';
  static String getLocalizedFontFamily() {

    final currentLanguage = SharedPref().getString(SharedPrefKeys.language);
    if(currentLanguage == 'ar'){
      return cairoArabic;

    }else{
      return poppinsEnglish;
    }
  }
}
