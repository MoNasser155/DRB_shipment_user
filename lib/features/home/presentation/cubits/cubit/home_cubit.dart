import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/features/home/data/models/ads_banner_model.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/state_status.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../domain/use_cases/get_ads_usecase.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final _getAdsUsecase = sl<GetAdsUsecase>();

  Future<void> initHome(UserEntity user) async {
    emit(state.copyWith(status: StateStatus.loading));
    setUserData(user);
    Future.wait([fetchAds()]);
    emit(state.copyWith(status: StateStatus.success));
  }

  setUserData(UserEntity user) {
    formatedDate();
    emit(state.copyWith(user: user));
  }

  Future<void> fetchAds() async {
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
