import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/shared/validations.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../cubits/reset_password_cubit/reset_password_cubit.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
          final cubit = ResetPasswordCubit.get(context);
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                CustomAppbar(title: LocaleKeys.verifyEmail),
                Gap(SpacingHelper.kVertical12),
                CustomTextField(
                  hint: LocaleKeys.email,
                  controller: cubit.emailController,
                  inputType: TextInputType.emailAddress,
                  validate: (val) {
                    return Validations.validateEmail(val!);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
