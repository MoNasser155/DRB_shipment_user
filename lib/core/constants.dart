import 'package:drb_shipment_user/core/languages/languages.dart';
import 'package:get_it/get_it.dart';

 GetIt sl = GetIt.instance;

class Constants {
  static const String kIsOnboardingViewed = 'isOnboardingViewed';
  static String question =
      Languages.currentLanguage.languageCode == 'ar' ? '؟' : '?';

  static String userKey = 'user';    
}
