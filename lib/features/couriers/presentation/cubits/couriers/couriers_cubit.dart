import 'package:drb_shipment_user/features/couriers/domain/use_cases/get_all_couriers_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../data/models/courier_model.dart';

part 'couriers_state.dart';

class CouriersCubit extends Cubit<CouriersState> {
  CouriersCubit() : super(CouriersState.initial());

  static CouriersCubit get(context) => BlocProvider.of(context);

  final _getAllCouriersUsecase = sl<GetAllCouriersUsecase>();

  Future<void> initCouriers(String companyId) async {
    emit(state.copyWith(status: StateStatus.loading));
    await Future.wait([_getAllCouriers(companyId)]);
    emit(state.copyWith(status: StateStatus.success));
  }

  Future<void> _getAllCouriers(String companyId) async {
    emit(state.copyWith(status: StateStatus.loading));
    final either = await _getAllCouriersUsecase.call(companyId);
    either.fold(
      (failure) {
        emit(
          state.copyWith(
            status: StateStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (couriers) {
        emit(state.copyWith(status: StateStatus.success, couriers: couriers));
      },
    );
  }
}
