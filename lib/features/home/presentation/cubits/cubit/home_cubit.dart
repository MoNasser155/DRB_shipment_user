import 'dart:developer';

import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/features/home/data/models/ads_banner_model.dart';
import 'package:drb_shipment_user/features/home/domain/use_cases/get_home_packages.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/state_status.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../packages/data/models/packages_model.dart';
import '../../../domain/use_cases/get_ads_usecase.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final _getAdsUsecase = sl<GetAdsUsecase>();
  final _getHomePackages = sl<GetHomePackages>();

  Future<void> initHome(UserEntity user) async {
    emit(state.copyWith(status: StateStatus.loading));
    setUserData(user);
    await Future.wait([_fetchAds(), _fetchHomePackages(user.uId!)]);
    emit(state.copyWith(status: StateStatus.success));
  }

  setUserData(UserEntity user) {
    formatedDate();
    emit(state.copyWith(user: user));
  }

  Future<void> _fetchAds() async {
    final result = await _getAdsUsecase.call();
    result.fold(
      (failure) {
        emit(state.copyWith(status: StateStatus.error));
      },
      (adsData) {
        emit(state.copyWith(adsList: adsData, status: StateStatus.success));
      },
    );
  }

  Future<void> _fetchHomePackages(String uId) async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _getHomePackages.call(uId);
    result.fold(
      (failure) {
        log('from cubit ${failure.message}');
        emit(state.copyWith(status: StateStatus.error));
      },
      (packagesData) {
        log('from cubit ${packagesData.length}');
        emit(
          state.copyWith(
            packagesList: packagesData,
            status: StateStatus.success,
          ),
        );
      },
    );
  }

  void formatedDate() {
    final now = DateTime.now();
    const months = [
      'jan',
      'feb',
      'mar',
      'apr',
      'may',
      'jun',
      'jul',
      'aug',
      'sep',
      'oct',
      'nov',
      'dec',
    ];
    final formatted = '${now.day} ${months[now.month - 1]} ${now.year}';
    emit(state.copyWith(date: formatted));
  }
}
