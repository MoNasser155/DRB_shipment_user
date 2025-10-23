import 'package:drb_shipment_user/core/enums/state_status.dart';
import 'package:drb_shipment_user/features/main_view/data/models/bottom_sheet_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(MainViewState.initial());

  static MainViewCubit get(context) => BlocProvider.of(context);

  final List<Widget> screens = [];
  final List<BottomSheetModel> tabs = [];



   void onTabPressed(int index) {
    if (index != state.selectedTabIndex && index >= 0 && index < 4) {
      emit(
        state.copyWith(selectedTabIndex: index, status: StateStatus.success),
      );
    }
  }

  // Handle tap outside gesture for nearest tab selection
  void onTapOutside(double localX, List<double> tabCenters) {
    double minDistance = double.infinity;
    int nearestIndex = state.selectedTabIndex;

    for (int i = 0; i < tabCenters.length; i++) {
      final distance = (localX - tabCenters[i]).abs();
      if (distance < minDistance) {
        minDistance = distance;
        nearestIndex = i;
      }
    }

    if (nearestIndex != state.selectedTabIndex) {
      onTabPressed(nearestIndex);
    }
  }

  // Set initial tab
  void setInitialTab(int index) {
    if (index >= 0 && index < 4) {
      emit(
        state.copyWith(selectedTabIndex: index, status: StateStatus.initial),
      );
    }
  }

  // Check if tab is selected
  bool isTabSelected(int index) => state.selectedTabIndex == index;
}
