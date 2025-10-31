import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/navigator_helper.dart';

enum Languages {
  english(Locale('en'), 'English', 'en', 1),
  arabic(Locale('ar'), 'Arabic', 'ar', 0);

  final String title;
  final Locale locale;
  final String languageCode;
  final int languageIndex;

  const Languages(
    this.locale,
    this.title,
    this.languageCode,
    this.languageIndex,
  );

  static List<Locale> get supportedLocales =>
      Languages.values.map((e) => e.locale).toList();

  static List<String> get titles =>
      Languages.values.map((e) => e.title).toList();

  static Future<void> setLocaleWithContext(
    BuildContext context,
    Languages lang,
  ) async {
    await context.setLocale(lang.locale);
  }

  static String getLanguageCode(Languages language) {
    return language.locale.languageCode;
  }

  static Languages get currentLanguage {
    final context = AppNavigator.navigatorKey.currentContext;
    if (context == null) return Languages.english;

    final currentLocale = EasyLocalization.of(context)?.locale;
    return Languages.values.firstWhere(
      (element) => element.locale == currentLocale,
      orElse: () => Languages.english,
    );
  }

  static int get currentLanguageIndex {
    return currentLanguage.languageIndex;
  }
}

extension LanguagesExtension on Languages {
  bool get isEnglish => this == Languages.english;
  bool get isArabic => this == Languages.arabic;
}
