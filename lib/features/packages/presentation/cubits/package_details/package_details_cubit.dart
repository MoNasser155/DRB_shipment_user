import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/helpers/distance_calculator_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../companies/data/models/company_model.dart';
import '../../../../couriers/data/models/courier_model.dart';
import '../../../data/models/packages_model.dart';
import '../../../domain/use_cases/get_company_by_id_usecase.dart';
import '../../../domain/use_cases/get_courier_by_id_usecase.dart';
import '../../../domain/use_cases/get_sender_by_id_usecase.dart';

part 'package_details_state.dart';

class PackageDetailsCubit extends Cubit<PackageDetailsState> {
  PackageDetailsCubit() : super(PackageDetailsState.initial());

  static PackageDetailsCubit get(context) => BlocProvider.of(context);

  final _getSenderByIdUsecase = sl<GetSenderByIdUsecase>();
  final _getCourierByIdUsecase = sl<GetCourierByIdUsecase>();
  final _getCompanyByIdUsecase = sl<GetCompanyByIdUsecase>();

  GoogleMapController? _mapController;

  Future<void> initPackageDetails(PackageModel packagesModel) async {
    emit(state.copyWith(status: StateStatus.loading));
    _setPackageData(packagesModel);
    _setCamerPosition(packagesModel);
    _generatePolylinePoints(packagesModel);
    await Future.wait([
      _fetchSenderById(packagesModel.senderId),
      _fetchCompanyById(packagesModel.companyId),
      _fetchCourierById(packagesModel.courierId),
    ]);
    emit(state.copyWith(status: StateStatus.success));
  }

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  _setPackageData(PackageModel packagesModel) {
    emit(state.copyWith(packagesModel: packagesModel));
  }

  void _setCamerPosition(PackageModel packagesModel) {
    final pickup = packagesModel.pickupLocation;
    final dropoff = packagesModel.dropoffLocation;
    final centerLat = (pickup.location.latitude + dropoff.location.latitude) / 2;
    final centerLng = (pickup.location.longitude + dropoff.location.longitude) / 2;
    final cameraPosition = CameraPosition(
      target: LatLng(centerLat, centerLng),
      zoom: calculateZoom(),
    );
    emit(state.copyWith(cameraPosition: cameraPosition));
  }

  double calculateZoom() {
    final zoom = DistanceCalculatorHelper.calculateZoom(
      state.packagesModel.pickupLocation.location,
      state.packagesModel.dropoffLocation.location,
    );
    return zoom;
  }

  void _generatePolylinePoints(PackageModel packagesModel) {
    final List<LatLng> polylinePoints = [
      LatLng(
        packagesModel.pickupLocation.location.latitude,
        packagesModel.pickupLocation.location.longitude,
      ),
      LatLng(
        packagesModel.dropoffLocation.location.latitude,
        packagesModel.dropoffLocation.location.longitude,
      ),
    ];
    final polyline = Polyline(
      polylineId: const PolylineId('route'),
      points: polylinePoints,
      color: ColorHelper.primaryGreen,
      width: 3,
    );

    final markers = <Marker>{
      Marker(
        markerId: MarkerId(LocaleKeys.pickupLocation),
        position: LatLng(
          packagesModel.pickupLocation.location.latitude,
          packagesModel.pickupLocation.location.longitude,
        ),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: LocaleKeys.pickupLocation),
      ),
      Marker(
        markerId: MarkerId(LocaleKeys.dropoffLocation),
        position: LatLng(
          packagesModel.dropoffLocation.location.latitude,
          packagesModel.dropoffLocation.location.longitude,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: LocaleKeys.dropoffLocation),
      ),
    };
    emit(state.copyWith(polylines: {polyline}, markers: markers));
  }

  Future<void> _fetchSenderById(String senderId) async {
    final result = await _getSenderByIdUsecase(senderId);
    result.fold(
      (failure) => emit(state.copyWith(status: StateStatus.error)),
      (user) => emit(state.copyWith(user: user)),
    );
  }

  Future<void> _fetchCourierById(String courierId) async {
    final result = await _getCourierByIdUsecase(courierId);
    result.fold((failure) => emit(state.copyWith(status: StateStatus.error)), (
      courier,
    ) {
      log(courier.toString());
      emit(state.copyWith(courier: courier, status: StateStatus.success));
    });
  }

  Future<void> _fetchCompanyById(String companyId) async {
    final result = await _getCompanyByIdUsecase(companyId);
    result.fold(
      (failure) => emit(state.copyWith(status: StateStatus.error)),
      (company) =>
          emit(state.copyWith(company: company, status: StateStatus.success)),
    );
  }

  @override
  Future<void> close() {
    _mapController?.dispose();
    return super.close();
  }
}
