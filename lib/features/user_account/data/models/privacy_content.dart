
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/languages/local_keys.g.dart';

class PrivacyContent {
  static List<Map<String, String>> getPrivacyData() {
    return [
      {
        'title': "1. ${LocaleKeys.pT1.tr()}:",
        'content':
            '${LocaleKeys.pD11.tr()}, ${LocaleKeys.pD12.tr()}, ${LocaleKeys.phoneNumber.tr()}, ${LocaleKeys.and.tr()} ${LocaleKeys.location.tr()} ${LocaleKeys.pD13.tr()}.',
      },
      {
        'title': "2. ${LocaleKeys.pT2.tr()}:",
        'content': '${LocaleKeys.pD21.tr()}, ${LocaleKeys.pD22.tr()}, ${LocaleKeys.pD23.tr()}.',
      },
      {
        'title': "3. ${LocaleKeys.pT3.tr()}:",
        'content': '${LocaleKeys.pD31.tr()}.',
      },
      {
        'title': "4. ${LocaleKeys.pT4.tr()}:",
        'content': '${LocaleKeys.pD41.tr()} (${LocaleKeys.pD42.tr()}).',
      },
      {
        'title': "5. ${LocaleKeys.pT5.tr()}:",
        'content':
            '${LocaleKeys.pD51.tr()}, ${LocaleKeys.update.tr()}, ${LocaleKeys.or.tr()} ${LocaleKeys.delete.tr()} ${LocaleKeys.pD52.tr()}.',
      },
    ];
  }
}
