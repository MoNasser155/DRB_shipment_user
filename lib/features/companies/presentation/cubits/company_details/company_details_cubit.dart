import 'package:drb_shipment_user/features/couriers/domain/use_cases/get_limited_couriers_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../couriers/data/models/courier_model.dart';
import '../../../data/models/company_model.dart';

part 'company_details_state.dart';

class CompanyDetailsCubit extends Cubit<CompanyDetailsState> {
  CompanyDetailsCubit() : super(CompanyDetailsState.initial());

  static CompanyDetailsCubit get(context) => BlocProvider.of(context);

  final _getLimitedCouriersUsecase = sl<GetLimitedCouriersUsecase>();

  Future<void> initCompanyDetails(CompanyModel company) async {
    emit(state.copyWith(status: StateStatus.loading));
    _setCompanyData(company);
    await Future.wait([_fetchTopCouriers()]);
    emit(state.copyWith(status: StateStatus.success));
  }

  void _setCompanyData(CompanyModel company) {
    emit(state.copyWith(companyModel: company));
  }

  void updateMaxLines(int maxLines) {
    emit(state.copyWith(maxDescriptionLines: maxLines));
  }

  Future<void> _fetchTopCouriers() async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _getLimitedCouriersUsecase.call(state.companyModel.id);
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (couriers) =>
          emit(state.copyWith(couriers: couriers, status: StateStatus.success)),
    );
  }
}
