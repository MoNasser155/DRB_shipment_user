import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/helpers/distance_calculator_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/utils/navigator_helper.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../companies/data/models/company_model.dart';
import '../../../../couriers/data/models/courier_model.dart';
import '../../../../reviews/data/models/review_model.dart';
import '../../../../reviews/domain/usecases/add_review_usecase.dart';
import '../../../../reviews/domain/usecases/get_review_usecase.dart';
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
  final _addReviewUsecase = sl<AddReviewUsecase>();
  final _getReviewUsecase = sl<GetReviewUsecase>();

  GoogleMapController? _mapController;

  final TextEditingController reviewController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> initPackageDetails(PackageModel packagesModel) async {
    emit(state.copyWith(status: StateStatus.loading));
    _setPackageData(packagesModel);
    _setCamerPosition(packagesModel);
    _generatePolylinePoints(packagesModel);
    await Future.wait([
      _fetchSenderById(packagesModel.senderId),
      _fetchCompanyById(packagesModel.companyId),
      _fetchCourierById(packagesModel.courierId),
      if (state.packagesModel.reviewId != null ||
          state.packagesModel.reviewId != '')
        getReviews(),
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
    final centerLat =
        (pickup.location.latitude + dropoff.location.latitude) / 2;
    final centerLng =
        (pickup.location.longitude + dropoff.location.longitude) / 2;
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

  Future<void> getReviews() async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _getReviewUsecase.call(
      reviewId: state.packagesModel.reviewId ?? '',
    );
    result.fold((failure) => emit(state.copyWith(status: StateStatus.error)), (
      reviews,
    ) {
      emit(state.copyWith(review: reviews, status: StateStatus.success));
    });
  }

  void setRating(double rating) {
    emit(state.copyWith(rating: rating));
  }

  ReviewModel setReviewData() {
    return ReviewModel(
      useId: state.user.id ?? '',
      packageId: state.packagesModel.id ?? '',
      createdAt: DateTime.now().toUtc().toString(),
      courierId: state.courier.id,
      rating: state.rating,
      comment: reviewController.text,
    );
  }

  Future<void> addReview() async {
    if (!formKey.currentState!.validate()) return;
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _addReviewUsecase.call(review: setReviewData());
    result.fold((failure) => emit(state.copyWith(status: StateStatus.error)), (
      _,
    ) {
      CustomSnackBar.top(
        msg: LocaleKeys.reviewAddedSuccessfully,
        color: Colors.green,
      );
      AppNavigator.pop();
      reviewController.clear();
      emit(state.copyWith(status: StateStatus.success, rating: 0));
    });
  }

  @override
  Future<void> close() {
    _mapController?.dispose();
    reviewController.dispose();
    return super.close();
  }
}
