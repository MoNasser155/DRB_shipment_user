import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:drb_shipment_user/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../custom_passfiled.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      child: Column(
        children: [
          CustomAppbar(title: LocaleKeys.changePassword),
          Text(
            textAlign: TextAlign.start,
            LocaleKeys.diffirentPass,
            style: AppTextTheme.text14W500grey300,
          ),
          Gap(SpacingHelper.kVertical12),
          PassFieldWithLabel(label: LocaleKeys.newPassword),
          Gap(SpacingHelper.kVertical12),
          PassFieldWithLabel(label: LocaleKeys.confirmNewPassword),
        ],
      ),
    );
  }
}
