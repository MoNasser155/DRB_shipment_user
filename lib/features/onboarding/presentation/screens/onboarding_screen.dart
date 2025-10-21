import 'package:drb_shipment_user/core/widgets/custom_dot_indicator.dart';
import 'package:drb_shipment_user/features/onboarding/presentation/cubits/cubit/onboarding_cubit.dart';
import 'package:drb_shipment_user/features/onboarding/presentation/widgets/onbaording_page_view_item.dart';
import 'package:drb_shipment_user/features/onboarding/presentation/widgets/onboarding_navigation_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  final cubit = OnboardingCubit.get(context);
                  return PageView.builder(
                    allowImplicitScrolling: false,
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    controller: cubit.pageController,
                    onPageChanged: cubit.onPageChanged,
                    itemBuilder: (context, index) {
                      final onbaordingData = cubit.onBoardingList[index];
                      return OnboardingPageViewItem(
                        onbaordingData: onbaordingData,
                      );
                    },
                    itemCount: cubit.onBoardingList.length,
                  );
                },
              ),
            ),
            Gap(16),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                final cubit = OnboardingCubit.get(context);
                return CustomDotIndicator(
                  currentIndex: state.currentPage,
                  count: cubit.onBoardingList.length,
                );
              },
            ),
            Gap(16),
            OnboardingNavigationButtons(),
            Gap(16),
          ],
        ),
      ),
    );
  }
}
