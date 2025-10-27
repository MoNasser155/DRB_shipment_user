import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'otp_counter.dart';
import 'otp_field.dart';

class ForgetPasswordOTPBody extends StatelessWidget {
  const ForgetPasswordOTPBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      child: Column(
        children: [
          CustomAppbar(title: LocaleKeys.verfiyOtp),
          Text(LocaleKeys.pinEmail, style: AppTextTheme.text14W600grey300),
          Gap(SpacingHelper.kVertical20),
          OtpField(onSubmit: (val) {}, onChange: (val) {}),
          Gap(SpacingHelper.kVertical12),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  text:
                      '${LocaleKeys.didntReceiveTheCode}${Constants.question} ',
                  style: AppTextTheme.text10W500grey300,
                  children: [
                    TextSpan(
                      text: LocaleKeys.resend,
                      style: AppTextTheme.underlineText14Primary,
                    ),
                  ],
                ),
              ),
              Spacer(),
              CountdownTimer(onTimerEnd: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
