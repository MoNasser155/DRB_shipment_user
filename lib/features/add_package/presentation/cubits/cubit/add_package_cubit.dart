import 'dart:developer';

import 'package:drb_shipment_user/core/enums/packages_status.dart';
import 'package:drb_shipment_user/core/enums/payment.dart';
import 'package:drb_shipment_user/core/shared/models/coordinates.dart';
import 'package:drb_shipment_user/core/widgets/custom_snack_bar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../packages/data/models/packages_model.dart';
import '../../../domain/usecases/add_package_usecase.dart';
import '../../widgets/package_pages/pckage_info.dart';
import '../../widgets/package_pages/sender_recierver_info.dart';

part 'add_package_state.dart';

class AddPackageCubit extends Cubit<AddPackageState> {
  AddPackageCubit() : super(AddPackageState.initial());

  static AddPackageCubit get(context) => BlocProvider.of(context);

  final _addPackageUsecase = sl<AddPackageUsecase>();

  final PageController pageController = PageController(initialPage: 0);

  final TextEditingController contentController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController recieverNameController = TextEditingController();
  final TextEditingController recieverPhoneNumberController =
      TextEditingController();
  final TextEditingController recieverEmailController = TextEditingController();

  final GlobalKey<FormState> packageInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> recieverInfoFormKey = GlobalKey<FormState>();

  final List<Widget> pages = [PckageInfo(), SenderRecierverInfo()];

  Future<void> initAddPackage(UserEntity user) async {
    emit(state.copyWith(status: StateStatus.loading));
    setUser(user);
    await Future.wait([]);
    emit(state.copyWith(status: StateStatus.success));
  }

  void setUser(UserEntity user) {
    emit(state.copyWith(user: user));
  }

  void setFragile(bool isFragile) {
    if (state.isFragile != isFragile) {
      emit(state.copyWith(isFragile: isFragile));
    }
  }

  PackagesModel setData() {
    return PackagesModel(
      status: PackagesStatus.inProgress.firebaseValue,
      senderId: state.user.uId!,
      packageContent: contentController.text,
      weight: double.parse(weightController.text),
      receiverName: recieverNameController.text,
      recieverPhone: recieverPhoneNumberController.text,
      receiverEmail: recieverEmailController.text,
      price: 0.0,
      isFragile: state.isFragile,
      paymentMethod: Payment.cash,
      pickupLocation: Coordinates(0, 0),
      dropoffLocation: Coordinates(0, 0),
    );
  }

  void changePage(int index) {
    if (index < 0 || index >= pages.length) return;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
    );
    emit(
      state.copyWith(
        currentPageIndex: index,
        isLastPage: index == pages.length - 1,
      ),
    );
  }

  void nextPage() {
    if (state.currentPageIndex == 0) {
      if (!packageInfoFormKey.currentState!.validate()) {
        return;
      }
    } else if (state.currentPageIndex == 1) {
      if (!recieverInfoFormKey.currentState!.validate()) {
        return;
      }
    }
    if (state.currentPageIndex < pages.length - 1) {
      changePage(state.currentPageIndex + 1);
    } else {
      addPackage();
    }
  }

  void previousPage() {
    if (state.currentPageIndex > 0) {
      changePage(state.currentPageIndex - 1);
    }
  }

  void onPageChanged(int index) {
    emit(
      state.copyWith(
        currentPageIndex: index,
        isLastPage: index == pages.length - 1,
      ),
    );
  }

  Future<void> addPackage() async {
    emit(state.copyWith(status: StateStatus.loading));
    log(setData().toJson().toString());
    final result = await _addPackageUsecase(setData());
    result.fold(
      (failure) {
        CustomSnackBar.top(msg: failure.message, color: ColorHelper.red);
        emit(
          state.copyWith(
            errorMessage: failure.message,
            status: StateStatus.error,
          ),
        );
      },
      (success) {
        CustomSnackBar.top(
          msg: LocaleKeys.packageAddedSuccessfully,
          color: ColorHelper.primaryGreen,
        );
        emit(state.copyWith(status: StateStatus.success));
        clear();
        changePage(0);
      },
    );
  }

  void clear() {
    contentController.clear();
    weightController.clear();
    recieverNameController.clear();
    recieverPhoneNumberController.clear();
    recieverEmailController.clear();
    setFragile(true);
  }

  @override
  Future<void> close() {
    contentController.dispose();
    weightController.dispose();
    recieverNameController.dispose();
    recieverPhoneNumberController.dispose();
    recieverEmailController.dispose();
    return super.close();
  }
}
