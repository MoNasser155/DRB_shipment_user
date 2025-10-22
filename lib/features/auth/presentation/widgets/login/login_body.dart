import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/core/extensions/extensions.dart';
import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:drb_shipment_user/core/widgets/textfield_withlabel.dart';
import 'package:drb_shipment_user/features/auth/presentation/widgets/custom_passfiled.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/app_assets/images.dart';
import '../../../../../core/utils/navigator_helper.dart';
import '../../../../../core/widgets/cutsom_button.dart';
import '../../../../../core/widgets/switch_lang_button.dart';
import '../../screens/signup_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              ),
              Gap(SpacingHelper.kVertical8),
              PassFieldWithLabel(
                label: LocaleKeys.password,
                removeInit: true,
                hint: '**********',
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
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.forgetPassword,
                    style: AppTextTheme.underlineText14Primary,
                  ),
                ),
              ),
              Gap(SpacingHelper.kVertical16),

              CustomButton(
                buttonChild: Text(
                  LocaleKeys.signIn,
                  style: AppTextTheme.buttonTextStyle,
                ),
                onTap: () {},
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
          Padding(
            padding: EdgeInsets.only(top: SpacingHelper.kVertical16),
            child: SwitchLangButton(),
          ),
        ],
      ),
    );
  }
}
