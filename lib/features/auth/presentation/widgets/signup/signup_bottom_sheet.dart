import 'package:drb_shipment_user/core/utils/navigator_helper.dart';
import 'package:drb_shipment_user/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../../core/widgets/cutsom_button.dart';
import '../../../../main_view/presentation/screens/main_view_screen.dart';

class SignupBottomSheet extends StatelessWidget {
  const SignupBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,

        children: [
          CustomButton(
            buttonChild: Text(
              LocaleKeys.signIn,
              style: AppTextTheme.buttonTextStyle,
            ),
            onTap: () {
              AppNavigator.pushReplacement(
                transitionBuilder: AppNavigator.cupertinoTransition,
                screen: MainViewScreen(),
              );
            },
          ),
          Gap(SpacingHelper.kVertical8),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${LocaleKeys.alreadyHaveAnAccount}${Constants.question} ',
                  style: AppTextTheme.nonlineText14White,
                ),
                TextButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                    visualDensity: VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                  ),
                  onPressed: () {
                    AppNavigator.pushReplacement(
                      transitionBuilder: AppNavigator.cupertinoTransition,
                      screen: LoginScreen(),
                    );
                  },
                  child: Text(
                    LocaleKeys.signIn,
                    style: AppTextTheme.underlineText14Primary,
                  ),
                ),
              ],
            ),
          ),
          Gap(SpacingHelper.kVertical8),
        ],
      ),
    );
  }
}
