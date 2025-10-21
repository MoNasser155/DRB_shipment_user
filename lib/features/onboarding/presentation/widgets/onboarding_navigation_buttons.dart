
import 'package:drb_shipment_user/core/widgets/cutsom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../cubits/cubit/onboarding_cubit.dart';

class OnboardingNavigationButtons extends StatelessWidget {
  const OnboardingNavigationButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        buildWhen: (previous, current) {
          return previous.currentPage != current.currentPage;
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
                    buttonChild: const Text('previos'),
                  ),
                ),
              ),
              Visibility(
                visible: state.currentPage != 0,
                child: Gap(8.w),
              ),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    cubit.nextPage();
                  },
                  buttonChild: const Text('Next'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
