import 'package:easy_localization/easy_localization.dart';
import '../../../../core/languages/local_keys.g.dart';

class TermsContent {
  static List<Map<String, String>> getTermsData() {
    return [
      {
        'title': "1. ${LocaleKeys.tCT1.tr()}:",
        'content':
            '${LocaleKeys.tCD11.tr()}, ${LocaleKeys.tCD12.tr()}. ${LocaleKeys.tCD13.tr()}, ${LocaleKeys.tCD14.tr()}.',
      },
      {
        'title': "2. ${LocaleKeys.tCT2.tr()}:",
        'content':
            '${LocaleKeys.tCD21.tr()}. ${LocaleKeys.tCD22.tr()}, ${LocaleKeys.tCD23.tr()}, ${LocaleKeys.tCD24.tr()}.',
      },
      {
        'title': "3. ${LocaleKeys.tCT3.tr()}:",
        'content': '${LocaleKeys.tCD31.tr()}.',
      },
      {
        'title': "4. ${LocaleKeys.tCT4.tr()}:",
        'content':
            '${LocaleKeys.tCD41.tr()}. ${LocaleKeys.tCD42.tr()}, ${LocaleKeys.tCD43.tr()}, ${LocaleKeys.tCD44.tr()}.',
      },
      {
        'title': "5. ${LocaleKeys.tCT5.tr()}:",
        'content': '${LocaleKeys.tCD51.tr()}. ${LocaleKeys.tCD52.tr()}.',
      },
      {
        'title': "6. ${LocaleKeys.tCT6.tr()}:",
        'content': '${LocaleKeys.tCD61.tr()}.',
      },
      {
        'title': "7. ${LocaleKeys.tCT7.tr()}:",
        'content':
            '${LocaleKeys.tCD71.tr()}, ${LocaleKeys.tCD72.tr()}, ${LocaleKeys.tCD73.tr()}, ${LocaleKeys.tCD74.tr()} "${LocaleKeys.contactUs.tr()}" ${LocaleKeys.tCD75.tr()}.',
      },
    ];
  }
}
