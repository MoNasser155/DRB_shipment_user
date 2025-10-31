import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../../core/utils/navigator_helper.dart';
import '../../../../../core/widgets/cutsom_button.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../../screens/signup_screen.dart';

class CustomLoginBottomSheet extends StatelessWidget {
  const CustomLoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        final cubit = LoginCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                buttonChild:
                    state.status == StateStatus.loading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                          LocaleKeys.signIn,
                          style: AppTextTheme.buttonTextStyle,
                        ),
                onTap: () {
                  state.status == StateStatus.loading ? null : cubit.login();
                },
              ),
              Gap(SpacingHelper.kVertical8),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${LocaleKeys.dontHaveAnAccount}${Constants.question} ',
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
                          screen: SignupScreen(),
                        );
                      },
                      child: Text(
                        LocaleKeys.registerAccount,
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
      },
    );
  }
}
