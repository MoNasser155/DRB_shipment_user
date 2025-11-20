import 'package:drb_shipment_user/core/enums/delivery_type.dart';
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
import '../../../../companies/data/models/company_model.dart';
import '../../../../couriers/data/models/courier_model.dart';
import '../../../../packages/data/models/packages_model.dart';
import '../../../data/models/governments_model.dart';
import 'add_package_mixin.dart';

part 'add_package_state.dart';

class AddPackageCubit extends Cubit<AddPackageState> with AddPackageMixin {
  AddPackageCubit() : super(AddPackageState.initial());

  static AddPackageCubit get(context) => BlocProvider.of(context);

  Future<void> initAddPackage(UserEntity user) async {
    emit(state.copyWith(status: StateStatus.loading));
    setUser(user);
    _fetchGovData();
    await Future.wait([_fetchCompanies()]);
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

  void setPickUpGov(GovernmentsData government) {
    emit(state.copyWith(pickUpGovernorate: government));
  }

  void setPickUpCity(Cities city) {
    emit(state.copyWith(pickUpCity: city));
  }

  void setDropOffGov(GovernmentsData government) {
    emit(state.copyWith(dropOffGovernorate: government));
  }

  void setDropOffCity(Cities city) {
    emit(state.copyWith(dropOffCity: city));
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

  void setDeliveryType(DeliveryType deliveryType) {
    emit(state.copyWith(selectedDeliveryType: deliveryType));
  }

  void setSelectedCompany(CompanyModel company) {
    emit(state.copyWith(selectedCompany: company, couriers: []));
    _fetchCouriers();
  }

  void setSelectedCourier(CourierModel courier) {
    emit(state.copyWith(selectedCourier: courier));
  }

  PackageModel setData() {
    return PackageModel(
      status: PackagesStatus.pending,
      senderId: state.user.id!,
      courierId: state.selectedCourier.id,
      companyId: state.selectedCompany.id,
      createdAt: DateTime.now().toUtc().toString(),
      deliveredAt: '',
      isAccepted: false,
      price: 0.0,
      deliveryType: state.selectedDeliveryType,
      pickupLocation: LocationInfo(
        location: state.pickupLocation ?? Coordinates(0, 0),
        address: pickUpAddressController.text,
        government: state.pickUpGovernorate.governmentEn,
        city: state.pickUpCity.cityEn,
      ),
      dropoffLocation: LocationInfo(
        location: state.dropoffLocation ?? Coordinates(0, 0),
        address: dropOffAddressController.text,
        government: state.dropOffGovernorate.governmentEn,
        city: state.dropOffCity.cityEn,
      ),
      packageDetails: PackageDetails(
        content: contentController.text,
        notes: packageNotesController.text,
        weight: double.parse(weightController.text),
        isFragile: state.isFragile,
      ),
      receiverInfo: ReveiverInfo(
        name: recieverNameController.text,
        phone: recieverPhoneNumberController.text,
        email: recieverEmailController.text,
      ),
      paymentDetails: PaymentDetails(
        id: '123',
        paymentMethod: state.selectedPaymentMethod,
        status: PaymentStatus.pending.firebaseValue,
      ),
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
      if (!pickupInfoFormKey.currentState!.validate()) return;
      if (state.pickupLocation == null) {
        CustomSnackBar.top(
          msg: LocaleKeys.pleasePickYourPickupLocation,
          color: ColorHelper.red,
        );
        return;
      }
      if (state.pickUpGovernorate.governmentEn == '' ||
          state.pickUpCity.cityEn == '') {
        CustomSnackBar.top(
          msg: LocaleKeys.pleaseSelectGovernmentAndCity,
          color: ColorHelper.red,
        );
        return;
      }
    } else if (state.currentPageIndex == 3) {
      if (!dropoffInfoFormKey.currentState!.validate()) return;
      if (state.dropoffLocation == null) {
        CustomSnackBar.top(
          msg: LocaleKeys.pleasePickYourDeliveryLocation,
          color: ColorHelper.red,
        );
        return;
      }
      if (state.dropOffGovernorate.governmentEn == '' ||
          state.dropOffCity.cityEn == '') {
        CustomSnackBar.top(
          msg: LocaleKeys.pleaseSelectGovernmentAndCity,
          color: ColorHelper.red,
        );
        return;
      }
    } else if (state.currentPageIndex == 4) {
      if (state.selectedCompany.name == '') {
        CustomSnackBar.top(
          msg: LocaleKeys.pleaseSelectCompanyFirst,
          color: ColorHelper.red,
        );
        return;
      }
      if (state.selectedCourier.name == '') {
        CustomSnackBar.top(
          msg: LocaleKeys.pleaseSelectCourier,
          color: ColorHelper.red,
        );
        return;
      }
    } else if (state.currentPageIndex == 5) {
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

  Future<void> _fetchGovData() async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await getGovernomentsUsecase.call();
    emit(state.copyWith(governmentsModel: result, status: StateStatus.success));
  }

  Future<void> _fetchCompanies() async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await getCompaniesUsecase.call();
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (companies) => emit(
        state.copyWith(companies: companies, status: StateStatus.success),
      ),
    );
  }

  Future<void> _fetchCouriers() async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await getAllCouriersUsecase.call(state.selectedCompany.id);
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (couriers) =>
          emit(state.copyWith(couriers: couriers, status: StateStatus.success)),
    );
  }

  Future<void> addPackage() async {
    emit(state.copyWith(status: StateStatus.loading));
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
        selectedDeliveryType: DeliveryType.regular,
        pickUpCity: Cities.initial(),
        pickUpGovernorate: GovernmentsData.initial(),
        dropOffCity: Cities.initial(),
        dropOffGovernorate: GovernmentsData.initial(),
        selectedCompany: null,
        selectedCourier: null,
      ),
    );
  }
}
