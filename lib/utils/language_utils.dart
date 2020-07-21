
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageUtils {
  static Map<String, Locale> get mapLocale {
    Locale localeEn = Locale('en', 'US');
    Locale localeVi = Locale('vi', 'VN');
    return {
      localeEn.countryCode: localeEn,
      localeVi.countryCode: localeVi
    };
  }
  static Map<String, String> get mapLocaleName {
    Locale localeEn = Locale('en', 'US');
    Locale localeVi = Locale('vi', 'VN');
    return {
      localeEn.countryCode: "english_language",
      localeVi.countryCode: "vietnamese_language"
    };
  }

  static List<Locale> locales = mapLocale.values.toList();
  static String defaultLocaleKey(BuildContext context) {
    return context.locale.countryCode;
  }
  static Locale currentLocale = mapLocale[defaultLocaleKey];
}