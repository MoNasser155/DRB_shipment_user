import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:drb_shipment_user/core/widgets/switch_lang_button.dart';
import 'package:drb_shipment_user/features/auth/presentation/widgets/signup/signup_info_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/app_assets/images.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';
import '../terms_cond_checkbox.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
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
                  LocaleKeys.createNewAccount,
                  style: AppTextTheme.text20W600grey100,
                ),
              ),
              Gap(SpacingHelper.kVertical20),
              SignupInfoContainers(),
              Gap(SpacingHelper.kVertical4),
              BlocBuilder<SignupCubit, SignupState>(
                buildWhen: (previous, current) {
                  return previous.isTermsAccepted != current.isTermsAccepted;
                },
                builder: (context, state) {
                  final cubit = SignupCubit.get(context);
                  return TermsCondCheckBox(
                    onChanged: (val) {
                      cubit.setIsTermsAccepted(val ?? false);
                    },
                  );
                },
              ),
              Gap(kBottomNavigationBarHeight * 1.9),
            ]),
          ),
        ),
      ],
    );
  }
}
