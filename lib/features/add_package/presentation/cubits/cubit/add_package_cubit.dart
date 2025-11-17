// ignore_for_file: unused_field

import 'dart:developer';

import 'package:drb_shipment_user/core/enums/packages_status.dart';
import 'package:drb_shipment_user/core/enums/payment.dart';
import 'package:drb_shipment_user/core/shared/models/coordinates.dart';
import 'package:drb_shipment_user/core/widgets/custom_snack_bar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../packages/data/models/packages_model.dart';
import 'add_package_mixin.dart';

part 'add_package_state.dart';

class AddPackageCubit extends Cubit<AddPackageState> with AddPackageMixin {
  AddPackageCubit() : super(AddPackageState.initial());

  static AddPackageCubit get(context) => BlocProvider.of(context);

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

  void setPickupLocation(LatLng location) {
    emit(
      state.copyWith(
        pickupLocation: Coordinates(location.latitude, location.longitude),
      ),
    );
  }

  void setDropoffLocation(LatLng location) {
    emit(
      state.copyWith(
        dropoffLocation: Coordinates(location.latitude, location.longitude),
      ),
    );
  }

  void setPaymentMethod(Payment paymentMethod) {
    emit(state.copyWith(selectedPaymentMethod: paymentMethod));
  }

  PackageModel setData() {
    return PackageModel(
      status: PackagesStatus.inProgress.firebaseValue,
      senderId: state.user.id!,
      packageContent: contentController.text,
      weight: double.parse(weightController.text),
      receiverName: recieverNameController.text,
      recieverPhone: recieverPhoneNumberController.text,
      receiverEmail: recieverEmailController.text,
      price: 0.0,
      isFragile: state.isFragile,
      paymentMethod: state.selectedPaymentMethod,
      pickupLocation: state.pickupLocation ?? Coordinates(0.0, 0.0),
      dropoffLocation: state.dropoffLocation ?? Coordinates(0.0, 0.0),
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
    } else if (state.currentPageIndex == 2) {
      if (state.pickupLocation == null) {
        CustomSnackBar.top(
          msg: LocaleKeys.pleasePickYourPickupLocation,
          color: ColorHelper.red,
        );
        return;
      }
      if (state.dropoffLocation == null) {
        CustomSnackBar.top(
          msg: LocaleKeys.pleasePickYourDeliveryLocation,
          color: ColorHelper.red,
        );
        return;
      }
    } else if (state.currentPageIndex == 3) {
      if (state.selectedPaymentMethod == Payment.visa) {
        if (!paymentInfoFormKey.currentState!.validate()) {
          return;
        }
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
    final result = await addPackageUsecase(setData());
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

  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }

  void clear() {
    clearWithMixin();
    emit(
      state.copyWith(
        pickupLocation: null,
        dropoffLocation: null,
        selectedPaymentMethod: Payment.cash,
      ),
    );
  }
}
