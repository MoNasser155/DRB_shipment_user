import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../data/models/packages_model.dart';
import '../../../domain/use_cases/get_sender_by_id_usecase.dart';

part 'package_details_state.dart';

class PackageDetailsCubit extends Cubit<PackageDetailsState> {
  PackageDetailsCubit() : super(PackageDetailsState.initial());

  static PackageDetailsCubit get(context) => BlocProvider.of(context);

  final _getSenderBtIdUsecase = sl<GetSenderByIdUsecase>();

  Future<void> initPackageDetails(PackagesModel packagesModel) async {
    emit(state.copyWith(status: StateStatus.loading));
    _setPackageData(packagesModel);
    await Future.wait([_fetchSenderById(packagesModel.senderId)]);
    emit(state.copyWith(status: StateStatus.success));
  }

  _setPackageData(PackagesModel packagesModel) {
    emit(state.copyWith(packagesModel: packagesModel));
  }

  Future<void> _fetchSenderById(String uId) async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _getSenderBtIdUsecase(uId);
    result.fold(
      (failure) => emit(state.copyWith(status: StateStatus.error)),
      (user) => emit(state.copyWith(status: StateStatus.success, user: user)),
    );
  }
}
