import 'package:drb_shipment_user/core/languages/languages.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class Constants {
  static const String kIsOnboardingViewed = 'isOnboardingViewed';
  static String get questionMark =>
      Languages.currentLanguage.languageCode == 'ar' ? '؟' : '?';

  static String userKey = 'user';
  static const String governmentData = 'assets/governoments/governorates.json';
}

class Collections {
  static const String users = 'user';
  static const String packages = 'packages';
  static const String companies = 'companies';
  static const String couriers = 'courier';
  static const String reviews = 'reviews';
  static const String ads = 'ads';
  static const String faqs = 'faqs';
}
