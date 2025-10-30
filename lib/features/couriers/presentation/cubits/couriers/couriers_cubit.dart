import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../data/models/couriers_company_model.dart';
import '../../../domain/usecases/get_couriers_company_usecase.dart';

part 'couriers_state.dart';

class CouriersCubit extends Cubit<CouriersState> {
  CouriersCubit() : super(CouriersState.initial());

  static CouriersCubit get(context) => BlocProvider.of(context);

  final _getCouriersCompany = sl<GetCouriersCompanyUsecase>();

  Future<void> initCouriers() async {
    emit(state.copyWith(status: StateStatus.loading));
    await Future.wait([_fetchCouriers()]);
    emit(state.copyWith(status: StateStatus.success));
  }

  Future<void> _fetchCouriers() async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _getCouriersCompany.call();
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (companies) => emit(
        state.copyWith(companies: companies, status: StateStatus.success),
      ),
    );
  }
}
