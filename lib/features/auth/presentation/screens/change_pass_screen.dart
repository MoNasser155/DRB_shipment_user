import 'package:flutter/material.dart';

import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../../core/widgets/cutsom_button.dart';
import '../widgets/forget_password/change_password_body.dart';

class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({super.key});

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
            LocaleKeys.changePassword,
            style: AppTextTheme.buttonTextStyle,
          ),
          onTap: () {},
        ),
      ),
      body: ChangePasswordBody(),
    );
  }
}
