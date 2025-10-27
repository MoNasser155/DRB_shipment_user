part of '../imports/user_account_imports.dart';

class UserAccountBody extends StatelessWidget {
  const UserAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        UserAccountSliverAppbar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                AccountoptionRow(
                  option: LocaleKeys.profile,
                  withPrefix: true,
                  withSuffix: true,
                  prefixIcon: const Icon(
                    Icons.account_circle,
                    color: ColorHelper.primaryGreen,
                  ),
                  nextScreenRoute: () {},
                ),
                AccountoptionRow(
                  option: LocaleKeys.settings,
                  withSuffix: true,
                  withPrefix: true,
                  prefixIcon: SvgPicture.asset(
                    AppIcons.settings,
                    colorFilter: ColorFilter.mode(
                      ColorHelper.primaryGreen,
                      BlendMode.srcIn,
                    ),
                  ),
                  nextScreenRoute: () {
                    // AppNavigator.push(screen: SettingsScreen());
                  },
                ),

                AccountoptionRow(
                  option: LocaleKeys.language,
                  withSuffix: true,
                  withPrefix: true,
                  suffixIcon: SwitchLangButton(),
                  prefixIcon: SvgPicture.asset(
                    AppIcons.language,
                    colorFilter: ColorFilter.mode(
                      ColorHelper.primaryGreen,
                      BlendMode.srcIn,
                    ),
                  ),
                  nextScreenRoute: null,
                ),
                AccountoptionRow(
                  option: LocaleKeys.helpCenter,
                  withPrefix: true,
                  withSuffix: true,
                  prefixIcon: SvgPicture.asset(
                    AppIcons.helpCenter,
                    colorFilter: ColorFilter.mode(
                      ColorHelper.primaryGreen,
                      BlendMode.srcIn,
                    ),
                  ),
                  nextScreenRoute: () {},
                ),
                Gap(20.h),
                // AccountoptionRow(
                //   option: LocaleKeys.about,
                //   withSuffix: false,
                //   withPrefix: false,
                //   nextScreenRoute: () {
                //     AppNavigator.push(
                //       transitionBuilder: AppNavigator.cupertinoTransition,
                //       screen: AboutUsScreen(),
                //     );
                //   },
                // ),
                // AccountoptionRow(
                //   option: '${LocaleKeys.terms} & ${LocaleKeys.conditions}',
                //   withSuffix: false,
                //   withPrefix: false,
                //   nextScreenRoute: () {
                //     AppNavigator.push(
                //       transitionBuilder: AppNavigator.cupertinoTransition,
                //       screen: TermsConditionScreen(),
                //     );
                //   },
                // ),
                // AccountoptionRow(
                //   option: LocaleKeys.privacyPolicy,
                //   withSuffix: false,
                //   withPrefix: false,
                //   nextScreenRoute: () {
                //     AppNavigator.push(
                //       transitionBuilder: AppNavigator.cupertinoTransition,
                //       screen: PrivacyPolicyScreen(),
                //     );
                //   },
                // ),
                Gap(20.h),
                AccountoptionRow(
                  option: LocaleKeys.logout,
                  optionStyle: AppTextTheme.text16W500grey100.copyWith(
                    color: ColorHelper.red,
                  ),
                  withSuffix: false,
                  withPrefix: true,
                  prefixIcon: Icon(
                    Icons.logout_rounded,
                    color: ColorHelper.red,
                  ),
                  nextScreenRoute: () {
                    showModalBottomSheet(
                      backgroundColor: ColorHelper.grey900,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context) => const LogoutBody(),
                    );
                  },
                ),
                Gap(kBottomNavigationBarHeight + 24.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
