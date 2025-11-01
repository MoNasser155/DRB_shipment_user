import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/switch_lang_button.dart';
import '../../data/models/terms_content.dart';
import '../widgets/privacy_terms_tile.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final termsData = TermsContent.getTermsData();
    return Scaffold(
      key: ValueKey(context.locale.toString()),
      appBar: AppBar(),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            surfaceTintColor: Colors.transparent,
            backgroundColor: ColorHelper.backgroundBlack,
            flexibleSpace: CustomAppbar(
              title: '${LocaleKeys.terms} & ${LocaleKeys.conditions}',
              applyPadding: true,
              suffix: SwitchLangButton(isShorten: true),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: SpacingHelper.kHorizontalPadding,
            ),
            sliver: SliverList.separated(
              itemBuilder: (context, index) {
                final data = termsData[index];
                final title = data['title'];
                final description = data['content'];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SpacingHelper.horizontal6,
                    vertical: SpacingHelper.kVertical12,
                  ),
                  child: TermsConditionTile(
                    title: title ?? '',
                    description: description ?? '',
                  ),
                );
              },
              separatorBuilder: (context, index) => Gap(0),
              itemCount: termsData.length,
            ),
          ),
        ],
      ),
    );
  }
}
