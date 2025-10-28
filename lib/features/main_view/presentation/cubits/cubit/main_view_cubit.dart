import 'package:drb_shipment_user/core/app_assets/icons.dart';
import 'package:drb_shipment_user/core/enums/state_status.dart';
import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:drb_shipment_user/features/auth/domain/entities/user_entity.dart';
import 'package:drb_shipment_user/features/couriers/presentation/screens/couriers_screen.dart';
import 'package:drb_shipment_user/features/main_view/data/models/bottom_sheet_model.dart';
import 'package:drb_shipment_user/features/user_account/presentation/imports/user_account_imports.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/screens/home_screen.dart';
import '../../../../packages/presentation/screens/packages_screen.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(MainViewState.initial()) {
    setInitialTab(0);
  }

  static MainViewCubit get(context) => BlocProvider.of(context);
  setUserData(UserEntity user) {
    emit(state.copyWith(user: user, status: StateStatus.success));
  }

  List<Widget> get screens => [
    HomeScreen(user: state.user),
    PackagesScreen(),
    Container(width: 200, height: 200, color: Colors.blue),
    CouriersScreen(),
    UserAccountScreen(),
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
