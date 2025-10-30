import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/helpers/distance_calculator_helper.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../data/models/packages_model.dart';
import '../../../domain/use_cases/get_sender_by_id_usecase.dart';

part 'package_details_state.dart';

class PackageDetailsCubit extends Cubit<PackageDetailsState> {
  PackageDetailsCubit() : super(PackageDetailsState.initial());

  static PackageDetailsCubit get(context) => BlocProvider.of(context);

  final _getSenderBtIdUsecase = sl<GetSenderByIdUsecase>();

  GoogleMapController? _mapController;

  Future<void> initPackageDetails(PackagesModel packagesModel) async {
    emit(state.copyWith(status: StateStatus.loading));
    _setPackageData(packagesModel);
    _setCamerPosition(packagesModel);
    _generatePolylinePoints(packagesModel);
    await Future.wait([_fetchSenderById(packagesModel.senderId)]);
    emit(state.copyWith(status: StateStatus.success));
  }

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  _setPackageData(PackagesModel packagesModel) {
    emit(state.copyWith(packagesModel: packagesModel));
  }

  void _setCamerPosition(PackagesModel packagesModel) {
    final pickup = packagesModel.pickupLocation;
    final dropoff = packagesModel.dropoffLocation;
    final centerLat = (pickup.latitude + dropoff.latitude) / 2;
    final centerLng = (pickup.longitude + dropoff.longitude) / 2;
    final cameraPosition = CameraPosition(
      target: LatLng(centerLat, centerLng),
      zoom: calculateZoom(),
    );
    emit(state.copyWith(cameraPosition: cameraPosition));
  }

  double calculateZoom() {
    final zoom = DistanceCalculatorHelper.calculateZoom(
      state.packagesModel.pickupLocation,
      state.packagesModel.dropoffLocation,
    );
    return zoom;
  }

  void _generatePolylinePoints(PackagesModel packagesModel) {
    final List<LatLng> polylinePoints = [
      LatLng(
        packagesModel.pickupLocation.latitude,
        packagesModel.pickupLocation.longitude,
      ),
      LatLng(
        packagesModel.dropoffLocation.latitude,
        packagesModel.dropoffLocation.longitude,
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
        markerId: const MarkerId('pickupLocation'),
        position: LatLng(
          packagesModel.pickupLocation.latitude,
          packagesModel.pickupLocation.longitude,
        ),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: const InfoWindow(title: 'Pickup Location'),
      ),
      Marker(
        markerId: const MarkerId('dropoffLocation'),
        position: LatLng(
          packagesModel.dropoffLocation.latitude,
          packagesModel.dropoffLocation.longitude,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: const InfoWindow(title: 'Dropoff Location'),
      ),
    };
    emit(state.copyWith(polylines: {polyline}, markers: markers));
  }

  Future<void> _fetchSenderById(String uId) async {
    final result = await _getSenderBtIdUsecase(uId);
    result.fold(
      (failure) => emit(state.copyWith(status: StateStatus.error)),
      (user) => emit(state.copyWith(user: user)),
    );
  }

  @override
  Future<void> close() {
    _mapController?.dispose();
    return super.close();
  }
}
