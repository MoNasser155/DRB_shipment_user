import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants.dart';
import '../../../../core/enums/state_status.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/widgets/cutsom_button.dart';
import '../cubits/reset_password_cubit/reset_password_cubit.dart';
import '../widgets/forget_password/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ResetPasswordCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
            vertical: SpacingHelper.kVertical16,
          ),
          child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
            buildWhen: (previous, current) {
              return previous.status != current.status;
            },
            builder: (context, state) {
              final cubit = ResetPasswordCubit.get(context);
              return CustomButton(
                isLaoding: state.status == StateStatus.loading,
                buttonChild: Text(
                  LocaleKeys.next,
                  style: AppTextTheme.buttonTextStyle,
                ),
                onTap: () {
                  cubit.resetPassword();
                },
              );
            },
          ),
        ),
        body: ForgetPasswordBody(),
      ),
    );
  }
}
