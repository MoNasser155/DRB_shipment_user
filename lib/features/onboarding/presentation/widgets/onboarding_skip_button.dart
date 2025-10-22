import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit/onboarding_cubit.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final cubit = OnboardingCubit.get(context);
        return Visibility(
          visible: state.currentPage != 2,
          child: InkWell(
            onTap: () {
              cubit.skipOnboarding();
            },
            child: Text(
              LocaleKeys.skip,
              style: AppTextTheme.underlineText14White,
            ),
          ),
        );
      },
    );
  }
}
