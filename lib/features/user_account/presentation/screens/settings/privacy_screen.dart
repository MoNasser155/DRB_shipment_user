import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../../core/widgets/cutsom_button.dart';
import '../../cubits/AccountPrivacy/account_privacy_cubit.dart';
import '../../widgets/account_option_row.dart';
import '../../widgets/changepassword_fields.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountPrivacyCubit(),
      child: BlocBuilder<AccountPrivacyCubit, AccountPrivacyState>(
        builder: (context, state) {
          AccountPrivacyCubit privacyCubit = AccountPrivacyCubit.get(context);
          return GestureDetector(
            onTap: () => context.hideKeyboard(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                toolbarHeight: 48.h,
                backgroundColor: ColorHelper.backgroundBlack,
                foregroundColor: ColorHelper.transparent,
                shadowColor: ColorHelper.grey350,
                surfaceTintColor: ColorHelper.transparent,
                title: Text(
                  privacyCubit.changePassword
                      ? LocaleKeys.changePassword
                      : LocaleKeys.privacy,
                  style: AppTextTheme.appBarTitle,
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: ColorHelper.grey100,
                  ),
                  onPressed: () {
                    privacyCubit.changePassword
                        ? privacyCubit.startChangingPassword()
                        : Navigator.pop(context);
                  },
                ),
              ),
              bottomSheet:
                  privacyCubit.changePassword
                      ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SpacingHelper.kHorizontalPadding,
                          vertical: SpacingHelper.kVertical16,
                        ),
                        child: CustomButton(
                          buttonChild: Text(
                            LocaleKeys.changePassword,
                            style: AppTextTheme.buttonTextStyle,
                          ),
                          onTap: () {
                            if (privacyCubit.fKey.currentState!.validate()) {
                              privacyCubit.updatePassword();
                            }
                          },
                        ),
                      )
                      : null,
              body:
                  !privacyCubit.changePassword
                      ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SpacingHelper.kHorizontalPadding,
                        ),
                        child: AccountoptionRow(
                          option: LocaleKeys.changePassword,
                          withSuffix: true,
                          withPrefix: true,
                          nextScreenRoute: () {
                            privacyCubit.startChangingPassword();
                          },
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: ColorHelper.primaryGreen,
                          ),
                        ),
                      )
                      : ChangePasswordFields(),
            ),
          );
        },
      ),
    );
  }
}
