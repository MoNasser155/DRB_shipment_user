import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:drb_shipment_user/core/widgets/custom_dot_indicator.dart';
import 'package:drb_shipment_user/core/widgets/switch_lang_button.dart';
import 'package:drb_shipment_user/features/onboarding/presentation/cubits/cubit/onboarding_cubit.dart';
import 'package:drb_shipment_user/features/onboarding/presentation/widgets/onbaording_page_view_item.dart';
import 'package:drb_shipment_user/features/onboarding/presentation/widgets/onboarding_navigation_buttons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/onboarding_skip_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey(context.locale.toString()),
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              spacing: SpacingHelper.kVertical16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: BlocBuilder<OnboardingCubit, OnboardingState>(
                    buildWhen:
                        (previous, current) =>
                            previous.currentPage != current.currentPage ||
                            previous.status != current.status,
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

                BlocBuilder<OnboardingCubit, OnboardingState>(
                  buildWhen:
                      (previous, current) =>
                          previous.currentPage != current.currentPage ||
                          previous.status != current.status,
                  builder: (context, state) {
                    final cubit = OnboardingCubit.get(context);
                    return CustomDotIndicator(
                      currentIndex: state.currentPage,
                      count: cubit.onBoardingList.length,
                    );
                  },
                ),

                OnboardingNavigationButtons(),
                const SizedBox(),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SpacingHelper.kHorizontalPadding,
              ),
              child: Row(
                children: [
                  SwitchLangButton(),
                  const Spacer(),
                  OnboardingSkipButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
