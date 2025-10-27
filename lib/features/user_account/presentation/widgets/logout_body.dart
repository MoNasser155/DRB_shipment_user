part of '../imports/user_account_imports.dart';

class LogoutBody extends StatelessWidget {
  const LogoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSheetBody(
      child: Column(
        children: [
          Gap(20.h),
          Center(
            child: Icon(Icons.logout_rounded, color: ColorHelper.red, size: 64),
          ),
          Gap(SpacingHelper.kVertical20),
          Text(LocaleKeys.logout, style: AppTextTheme.text28W700White),
          Gap(20.h),
          Text(
            LocaleKeys.areYouSureYouWantToLogout,
            style: AppTextTheme.text16W500grey300,
          ),
          Gap(20.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  backgroundColor: ColorHelper.white,
                  borderColor: ColorHelper.primaryGreen,
                  buttonChild: Text(
                    LocaleKeys.cancel,
                    style: AppTextTheme.buttonTextStyle.copyWith(
                      color: ColorHelper.primaryGreen,
                    ),
                  ),
                  onTap: () {
                    AppNavigator.pop();
                  },
                ),
              ),
              Gap(12.w),
              Expanded(
                child: CustomButton(
                  backgroundColor: ColorHelper.red,
                  buttonChild: Text(
                    '${LocaleKeys.yes}, ${LocaleKeys.logout}',
                    style: AppTextTheme.buttonTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
