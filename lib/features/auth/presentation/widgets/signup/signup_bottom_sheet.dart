import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:drb_shipment_user/core/utils/navigator_helper.dart';
import 'package:drb_shipment_user/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:drb_shipment_user/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../../core/widgets/cutsom_button.dart';

class SignupBottomSheet extends StatelessWidget {
  const SignupBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      decoration: BoxDecoration(color: ColorHelper.backgroundBlack),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,

        children: [
          BlocBuilder<SignupCubit, SignupState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              final cubit = SignupCubit.get(context);
              return CustomButton(
                buttonChild:
                    state.status == StateStatus.loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                          LocaleKeys.signIn,
                          style: AppTextTheme.buttonTextStyle,
                        ),
                onTap: () {
                  state.status == StateStatus.loading ? null : cubit.signup();
                },
              );
            },
          ),
          Gap(SpacingHelper.kVertical8),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${LocaleKeys.alreadyHaveAnAccount}${Constants.question} ',
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
                      screen: LoginScreen(),
                    );
                  },
                  child: Text(
                    LocaleKeys.signIn,
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
  }
}
