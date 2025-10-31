import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:drb_shipment_user/core/widgets/textfield_withlabel.dart';
import 'package:drb_shipment_user/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:drb_shipment_user/features/auth/presentation/widgets/custom_passfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/app_assets/images.dart';
import '../../../../../core/shared/validations.dart';
import '../../../../../core/utils/navigator_helper.dart';
import '../../../../../core/widgets/switch_lang_button.dart';
import '../../screens/forget_password_screen.dart';


class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = LoginCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          child: Form(
            key: cubit.formKey,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              children: [
                Row(children: [SwitchLangButton()]),
                Gap(context.height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SpacingHelper.kHorizontalPadding,
                  ),
                  child: Center(
                    child: Image.asset(
                      AppImages.appLogo,
                      width: context.width * 0.5,
                    ),
                  ),
                ),
                Gap(SpacingHelper.kVertical20),
                Center(
                  child: Text(
                    LocaleKeys.welcomeBack,
                    style: AppTextTheme.text20W600grey100,
                  ),
                ),
                Gap(SpacingHelper.kVertical8),
                Center(
                  child: Text(
                    LocaleKeys.loginToAccessYourAccount,
                    style: AppTextTheme.text14W500grey300,
                  ),
                ),
                Gap(SpacingHelper.kVertical20),
                TextFieldWithLabel(
                  label: LocaleKeys.email,
                  removeInit: true,
                  hint: 'username@example.com',
                  controller: cubit.emailController,
                  validate: (val) {
                    return Validations.validateEmail(val);
                  },
                ),
                Gap(SpacingHelper.kVertical8),
                PassFieldWithLabel(
                  label: LocaleKeys.password,
                  removeInit: true,
                  hint: '**********',
                  controller: cubit.passwordController,
                  validate: (val) {
                    return Validations.validatePassword(val);
                  },
                ),
                Gap(SpacingHelper.kVertical4),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                      visualDensity: VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                    ),
                    onPressed: () {
                      AppNavigator.push(
                        transitionBuilder: AppNavigator.cupertinoTransition,
                        screen: ForgetPasswordScreen(),
                      );
                    },
                    child: Text(
                      LocaleKeys.forgetPassword,
                      style: AppTextTheme.underlineText14Primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

