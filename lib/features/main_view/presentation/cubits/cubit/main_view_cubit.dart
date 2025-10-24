import 'package:drb_shipment_user/core/app_assets/icons.dart';
import 'package:drb_shipment_user/core/enums/state_status.dart';
import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:drb_shipment_user/features/main_view/data/models/bottom_sheet_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/screens/home_screen.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(MainViewState.initial());

  static MainViewCubit get(context) => BlocProvider.of(context);

  final List<Widget> screens = [
    HomeScreen(),
    Container(width: 200, height: 200, color: Colors.red),
    Container(width: 200, height: 200, color: Colors.blue),
    Container(width: 200, height: 200, color: Colors.yellow),
    Container(width: 200, height: 200, color: Colors.purple),
  ];

  final List<BottomSheetModel> tabs = [
    BottomSheetModel(icon: AppIcons.home, label: LocaleKeys.home),
    BottomSheetModel(icon: AppIcons.packages, label: LocaleKeys.packages),
    BottomSheetModel(icon: AppIcons.newPackages, label: LocaleKeys.newPackage),
    BottomSheetModel(icon: AppIcons.couriers, label: LocaleKeys.couriers),
    BottomSheetModel(icon: AppIcons.account, label: LocaleKeys.account),
  ];

  void onTabPressed(int index) {
    if (index != state.selectedTabIndex && index >= 0 && index < 5) {
      emit(
        state.copyWith(selectedTabIndex: index, status: StateStatus.success),
      );
    }
  }

  void setInitialTab(int index) {
    if (index >= 0 && index < 5) {
      emit(
        state.copyWith(selectedTabIndex: index, status: StateStatus.initial),
      );
    }
  }

  bool isTabSelected(int index) => state.selectedTabIndex == index;
}
