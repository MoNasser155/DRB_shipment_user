
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_assets/icons.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../add_package/presentation/screens/add_new_package_screen.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../companies/presentation/screens/companies_screen.dart';
import '../../../../home/presentation/screens/home_screen.dart';
import '../../../../packages/presentation/screens/packages_screen.dart';
import '../../../../user_account/presentation/pages/user_account_screen.dart';
import '../../../data/models/bottom_sheet_model.dart';

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
    PackagesScreen(user: state.user),
    AddNewPackageScreen(user: state.user),
    CompaniesScreen(),
    UserAccountScreen(),
  ];

  List<BottomSheetModel> get tabs => [
    BottomSheetModel(icon: AppIcons.home, label: LocaleKeys.home),
    BottomSheetModel(icon: AppIcons.packages, label: LocaleKeys.packages),
    BottomSheetModel(icon: AppIcons.newPackages, label: LocaleKeys.newPackage),
    BottomSheetModel(icon: AppIcons.couriers, label: LocaleKeys.companies),
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
