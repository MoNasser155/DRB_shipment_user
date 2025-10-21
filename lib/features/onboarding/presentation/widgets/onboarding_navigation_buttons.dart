import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:drb_shipment_user/core/widgets/cutsom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../cubits/cubit/onboarding_cubit.dart';

class OnboardingNavigationButtons extends StatelessWidget {
  const OnboardingNavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        buildWhen: (previous, current) {
          return previous.currentPage != current.currentPage ||
              previous.status != current.status;
        },
        builder: (context, state) {
          final cubit = OnboardingCubit.get(context);
          return Row(
            children: [
              Visibility(
                visible: state.currentPage != 0,
                child: Expanded(
                  child: CustomButton(
                    onTap: () {
                      cubit.previousPage();
                    },
                    buttonChild: Text(
                      LocaleKeys.previous,
                      style: AppTextTheme.buttonTextStyle,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: state.currentPage != 0,
                child: Gap(SpacingHelper.horizontal8),
              ),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    cubit.nextPage();
                  },
                  buttonChild: Text(
                    LocaleKeys.next,
                    style: AppTextTheme.buttonTextStyle,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
