import 'package:drb_shipment_user/features/user_account/presentation/widgets/account_option_row.dart';
import 'package:flutter/material.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/utils/navigator_helper.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../screens/profile/edit_profile_screen.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

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
            title: LocaleKeys.profile,
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
                option: LocaleKeys.editProfile,
                withSuffix: true,
                withPrefix: true,
                prefixIcon: const Icon(
                  Icons.mode_edit,
                  color: ColorHelper.primaryGreen,
                ),
                nextScreenRoute: () {
                  AppNavigator.push(
                    transitionBuilder: AppNavigator.cupertinoTransition,
                    screen: const EditProfileScreen(),
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
