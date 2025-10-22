import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'forget_password_custom_appbar.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      child: Column(
        children: [
          ForgetPasswordCustomAppbar(title: LocaleKeys.verifyEmail),
          Gap(SpacingHelper.kVertical12),
          CustomTextField(hint: LocaleKeys.email),
        ],
      ),
    );
  }
}
