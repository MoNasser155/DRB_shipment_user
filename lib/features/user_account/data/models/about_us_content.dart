import 'package:easy_localization/easy_localization.dart';
import '../../../../core/languages/local_keys.g.dart';

class AboutUsContent {
  static List<Map<String, String>> getAboutUsData() {
    return [
      {
        'content':
            '${LocaleKeys.at.tr()} ${LocaleKeys.sHIPIFY.tr()}, ${LocaleKeys.aboutD1.tr()}. ${LocaleKeys.aboutD2.tr()} ${LocaleKeys.aboutD3.tr()}.',
      },
      {
        'content':
            '${LocaleKeys.aboutD4.tr()}, ${LocaleKeys.aboutD5.tr()}, ${LocaleKeys.aboutD6.tr()}, ${LocaleKeys.aboutD7.tr()}, ${LocaleKeys.aboutD8.tr()}. ${LocaleKeys.aboutD9.tr()}.',
      },
      {
        'content':
            '${LocaleKeys.aboutD10.tr()}, ${LocaleKeys.aboutD11.tr()}, ${LocaleKeys.aboutD12.tr()}.',
      },
    ];
  }
}