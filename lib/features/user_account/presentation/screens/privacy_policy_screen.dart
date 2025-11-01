import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/switch_lang_button.dart';
import '../../data/models/privacy_content.dart';
import '../widgets/privacy_terms_tile.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the dynamic data
    final privacyData = PrivacyContent.getPrivacyData();

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
            backgroundColor: Colors.transparent,
            flexibleSpace: CustomAppbar(
              title: LocaleKeys.privacyPolicy,
              applyPadding: true,
              suffix: SwitchLangButton(isShorten: true),
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) {
              final data = privacyData[index];
              final title = data['title'];
              final description = data['content'];

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SpacingHelper.horizontal16,
                  vertical: SpacingHelper.kVertical12,
                ),
                child: TermsConditionTile(
                  title: title ?? '',
                  description: description ?? '',
                ),
              );
            },
            separatorBuilder: (context, index) => Gap(0),
            itemCount: privacyData.length,
          ),
        ],
      ),
    );
  }
}
