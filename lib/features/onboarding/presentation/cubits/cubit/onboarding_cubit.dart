import 'dart:developer';

import 'package:drb_shipment_user/core/app_assets/images.dart';
import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:drb_shipment_user/features/onboarding/data/models/onbaorging_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/utils/shared_pref_sengelton.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.initial());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  late PageController pageController = PageController(initialPage: 0);

  final List<OnbaorgingModel> onBoardingList = [
    OnbaorgingModel(
      title: LocaleKeys.smartDeliveryTracking,
      body:
          '${LocaleKeys.getYourPackagesDeliveredAtRecordSpeedAnytime} ${LocaleKeys.anywhere}',
      image: AppImages.onboarding1,
    ),
    OnbaorgingModel(
      title: LocaleKeys.fastDelivery,
      body: LocaleKeys.realTimeUpdatesThatKeepYouInformedAndInControl,
      image: AppImages.onboarding2,
    ),
    OnbaorgingModel(
      title: LocaleKeys.easyPayments,
      body: LocaleKeys.paySecurelyAndEffortlesslyWithMultipleFlexibleOptions,
      image: AppImages.onboarding3,
    ),
  ];

  void changePage(int index) {
    if (index < 0 || index >= onBoardingList.length) return;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
    );

    emit(
      state.copyWith(
        currentPage: index,
        isLastPage: index == onBoardingList.length - 1,
      ),
    );
  }

  void nextPage() {
    if (state.currentPage < onBoardingList.length - 1) {
      changePage(state.currentPage + 1);
    } else {
      completeOnboarding();
    }
  }

  void previousPage() {
    if (state.currentPage > 0) {
      changePage(state.currentPage - 1);
    }
  }

  void onPageChanged(int index) {
    emit(
      state.copyWith(
        currentPage: index,
        isLastPage: index == onBoardingList.length - 1,
      ),
    );
  }

  void completeOnboarding() {
    Prefs.setBool(Constants.kIsOnboardingViewed, true);
    emit(state.copyWith(status: StateStatus.success));
    log(Prefs.getBool(Constants.kIsOnboardingViewed).toString());
    // AppNavigator.pushAndRemoveAll(screen: LoginScreen());
  }

  void skipOnboarding() {
    completeOnboarding();
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
