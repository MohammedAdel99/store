class FontFamilyHelper {
  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';
  static String getLocalizedFontFamily() {
    final String currentLanguage = 'en';
    if(currentLanguage == 'ar'){
      return cairoArabic;

    }else{
      return poppinsEnglish;
    }
  }
}
