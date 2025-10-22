import 'package:flutter/material.dart';

import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../../core/utils/navigator_helper.dart';
import '../../../../core/widgets/cutsom_button.dart';
import '../widgets/forget_password/forget_password_otp_body.dart';
import 'change_pass_screen.dart';

class ForgetPassOTP extends StatelessWidget {
  const ForgetPassOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingHelper.kHorizontalPadding,
          vertical: SpacingHelper.kVertical16,
        ),
        child: CustomButton(
          buttonChild: Text(
            LocaleKeys.next,
            style: AppTextTheme.buttonTextStyle,
          ),
          onTap: () {
            AppNavigator.push(
              transitionBuilder: AppNavigator.cupertinoTransition,
              screen: ChangePassScreen());
          },
        ),
      ),
      body: ForgetPasswordOTPBody(),
    );
  }
}
