import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/app_assets/icons.dart';
import '../../../../../../core/color_helper.dart';
import '../../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../../core/languages/local_keys.g.dart';
import '../../../../../../core/utils/navigator_helper.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import '../../../widgets/account_option_row.dart';
import 'delete_account_screen.dart';

class ManageAccountScreen extends StatelessWidget {
  const ManageAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            surfaceTintColor: Colors.transparent,
            backgroundColor: ColorHelper.backgroundBlack,
            flexibleSpace: CustomAppbar(
              title: LocaleKeys.manageAccount,
              applyPadding: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingHelper.kHorizontalPadding,
            ),
            sliver: SliverToBoxAdapter(
              child: AccountoptionRow(
                option: LocaleKeys.deleteAccount,
                withSuffix: true,
                withPrefix: true,
                nextScreenRoute: () {
                  AppNavigator.push(
                    transitionBuilder: AppNavigator.cupertinoTransition,
                    screen: DeleteAccountScreen(),
                  );
                },
                prefixIcon: SvgPicture.asset(
                  AppIcons.deleteAccount,
                  colorFilter: ColorFilter.mode(
                    ColorHelper.primaryGreen,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
