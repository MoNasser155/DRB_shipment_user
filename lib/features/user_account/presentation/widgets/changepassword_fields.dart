import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/shared/validations.dart';
import '../../../auth/presentation/widgets/custom_passfiled.dart';
import '../cubits/AccountPrivacy/account_privacy_cubit.dart';

class ChangePasswordFields extends StatefulWidget {
  const ChangePasswordFields({super.key});

  @override
  State<ChangePasswordFields> createState() => _ChangePasswordFieldsState();
}

class _ChangePasswordFieldsState extends State<ChangePasswordFields> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountPrivacyCubit, AccountPrivacyState>(
      builder: (context, state) {
        AccountPrivacyCubit privacyCubit = AccountPrivacyCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
            vertical: SpacingHelper.kVertical12,
          ),
          child: Stack(
            children: [
              Form(
                key: privacyCubit.fKey,
                child: Column(
                  spacing: SpacingHelper.kVertical12,
                  children: [
                    PassFieldWithLabel(
                      controller: privacyCubit.oldpassController,
                      validate: (p0) => Validations.validateEmpty(p0),
                      label: LocaleKeys.currentPassword,
                    ),
                    PassFieldWithLabel(
                      controller: privacyCubit.newpassController,
                      validate: (p0) => Validations.validateEmpty(p0),
                      label: LocaleKeys.newPassword,
                    ),
                    PassFieldWithLabel(
                      controller: privacyCubit.confirmpassController,
                      validate:
                          (p0) => Validations.validateConfirmPassword(
                            p0,
                            privacyCubit.newpassController.text,
                          ),
                      label: LocaleKeys.confirmNewPassword,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
