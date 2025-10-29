import 'package:drb_shipment_user/core/enums/state_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  PackagesCubit() : super(PackagesState.initial());

  static PackagesCubit get(context) => BlocProvider.of(context);

  void changeTabIndex(int index) {
    emit(state.copyWith(selectedTabIndex: index));
  }
}
