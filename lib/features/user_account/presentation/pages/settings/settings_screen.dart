import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/app_assets/icons.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/utils/navigator_helper.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../widgets/account_option_row.dart';
import 'manage_account/manage_account_screen.dart';
import 'manage_notifications_screen.dart';
import 'privacy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              title: LocaleKeys.settings,
              applyPadding: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: SpacingHelper.kHorizontalPadding,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  spacing: SpacingHelper.kVertical8,
                  children: [
                    AccountoptionRow(
                      option: LocaleKeys.privacy,
                      withSuffix: true,
                      withPrefix: true,
                      nextScreenRoute: () {
                        AppNavigator.push(
                          transitionBuilder: AppNavigator.cupertinoTransition,
                          screen: PrivacyScreen(),
                        );
                      },
                      prefixIcon: Icon(
                        Icons.verified_user,
                        color: ColorHelper.primaryGreen,
                        size: 24,
                      ),
                    ),
                    AccountoptionRow(
                      option: LocaleKeys.notifications,
                      withSuffix: true,
                      withPrefix: true,
                      nextScreenRoute: () {
                        AppNavigator.push(
                          transitionBuilder: AppNavigator.cupertinoTransition,
                          screen: ManageNotificationsScreen(),
                        );
                      },
                      prefixIcon: SvgPicture.asset(
                        AppIcons.notificationColored,
                        colorFilter: ColorFilter.mode(
                          ColorHelper.primaryGreen,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    AccountoptionRow(
                      option: LocaleKeys.manageAccount,
                      withSuffix: true,
                      withPrefix: true,
                      nextScreenRoute: () {
                        AppNavigator.push(
                          transitionBuilder: AppNavigator.cupertinoTransition,
                          screen: ManageAccountScreen(),
                        );
                      },
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: ColorHelper.primaryGreen,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
