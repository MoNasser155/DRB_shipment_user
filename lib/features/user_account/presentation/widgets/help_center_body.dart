import 'package:drb_shipment_user/features/user_account/presentation/widgets/account_option_row.dart';
import 'package:flutter/material.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/utils/navigator_helper.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../screens/help_center/faq_screen.dart';

class HelpCenterBody extends StatelessWidget {
  const HelpCenterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
            title: LocaleKeys.helpCenter,
            applyPadding: true,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              AccountoptionRow(
                option: LocaleKeys.fAQ,
                withSuffix: true,
                withPrefix: true,
                prefixIcon: const Icon(
                  Icons.question_answer,
                  color: ColorHelper.primaryGreen,
                  size: 20,
                ),
                nextScreenRoute: () {
                  AppNavigator.push(
                    transitionBuilder: AppNavigator.cupertinoTransition,
                    screen: const FaqScreen(),
                  );
                },
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
