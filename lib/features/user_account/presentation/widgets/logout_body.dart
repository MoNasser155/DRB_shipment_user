import 'package:drb_shipment_user/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../../core/utils/cashe_storage.dart';
import '../../../../core/utils/navigator_helper.dart';
import '../../../../core/widgets/cutsom_button.dart';
import '../../../../core/widgets/default_sheet_body.dart';
import '../../../auth/presentation/screens/login_screen.dart';

class LogoutBody extends StatelessWidget {
  const LogoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSheetBody(
      child: Column(
        spacing: SpacingHelper.kVertical20,
        children: [
          Gap(0),
          Center(
            child: Icon(Icons.logout_rounded, color: ColorHelper.red, size: 64),
          ),

          Text(LocaleKeys.logout, style: AppTextTheme.text28W700White),

          Text(
            LocaleKeys.areYouSureYouWantToLogout,
            style: AppTextTheme.text16W500grey300,
          ),

          Row(
            children: [
              Expanded(
                child: CustomButton(
                  backgroundColor: ColorHelper.white,
                  borderColor: ColorHelper.primaryGreen,
                  buttonChild: Text(
                    LocaleKeys.cancel,
                    style: AppTextTheme.buttonTextStyle.copyWith(
                      color: ColorHelper.primaryGreen,
                    ),
                  ),
                  onTap: () {
                    AppNavigator.pop();
                  },
                ),
              ),
              Gap(SpacingHelper.horizontal12),
              Expanded(
                child: CustomButton(
                  backgroundColor: ColorHelper.red,
                  buttonChild: Text(
                    '${LocaleKeys.yes}, ${LocaleKeys.logout}',
                    style: AppTextTheme.buttonTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    CacheStorage.delete(Constants.userKey);
                    AppNavigator.pushAndRemoveAll(
                      transitionBuilder: AppNavigator.cupertinoTransition,
                      screen: LoginScreen(),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
