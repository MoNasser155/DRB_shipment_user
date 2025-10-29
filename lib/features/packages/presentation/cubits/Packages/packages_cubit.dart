import 'package:drb_shipment_user/core/enums/packages_status.dart';
import 'package:drb_shipment_user/core/enums/state_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../data/models/packages_model.dart';
import '../../../domain/use_cases/get_packages_usecase.dart';

part 'packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  PackagesCubit() : super(PackagesState.initial());

  static PackagesCubit get(context) => BlocProvider.of(context);

  final _getPackagesUsecase = sl<GetPackagesUsecase>();

  void changeTabIndex(int index) {
    emit(
      state.copyWith(
        selectedTabIndex: index,
        status: StateStatus.loading,
        packages: [],
      ),
    );
    _getPackages(uId: state.user.uId!);
  }

  setUser(UserEntity user) {
    emit(state.copyWith(user: user));
  }

  Future<void> initPackages(UserEntity user) async {
    emit(state.copyWith(status: StateStatus.loading));
    setUser(user);
    await Future.wait([_getPackages(uId: user.uId!)]);
    emit(state.copyWith(status: StateStatus.success));
  }

  String _setPackageStatus() {
    switch (state.selectedTabIndex) {
      case 0:
        return PackagesStatus.inProgress.firebaseValue;
      case 1:
        return PackagesStatus.completed.firebaseValue;
      case 2:
        return PackagesStatus.canceled.firebaseValue;
      default:
        return PackagesStatus.inProgress.firebaseValue;
    }
  }

  Future<void> _getPackages({required String uId}) async {
    final result = await _getPackagesUsecase(uId, status: _setPackageStatus());
    result.fold(
      (failure) => emit(state.copyWith(status: StateStatus.error)),
      (packages) =>
          emit(state.copyWith(status: StateStatus.success, packages: packages)),
    );
  }
}
