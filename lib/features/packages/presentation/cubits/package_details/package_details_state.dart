part of 'package_details_cubit.dart';

class PackageDetailsState extends Equatable {
  final StateStatus status;
  final UserEntity user;
  final PackagesModel packagesModel;
  final String? errorMessage;
  final CameraPosition? cameraPosition;
  final Set<Polyline> polylines;
  final Set<Marker> markers;

  const PackageDetailsState({
    required this.status,
    required this.user,
    required this.packagesModel,
    this.errorMessage,
    this.cameraPosition,
    required this.polylines,
    required this.markers,
  });

  factory PackageDetailsState.initial() => PackageDetailsState(
    status: StateStatus.initial,
    user: UserEntity.initial(),
    packagesModel: PackagesModel.skeleton(),
    errorMessage: '',
    cameraPosition: null,
    polylines: const {},
    markers: const {},
  );

  PackageDetailsState copyWith({
    StateStatus? status,
    UserEntity? user,
    PackagesModel? packagesModel,
    String? errorMessage,
    CameraPosition? cameraPosition,
    Set<Polyline>? polylines,
    Set<Marker>? markers,
  }) {
    return PackageDetailsState(
      status: status ?? this.status,
      user: user ?? this.user,
      packagesModel: packagesModel ?? this.packagesModel,
      errorMessage: errorMessage ?? this.errorMessage,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      polylines: polylines ?? this.polylines,
      markers: markers ?? this.markers,
    );
  }

  @override
  List<Object?> get props => [
    status,
    user,
    packagesModel,
    errorMessage,
    cameraPosition,
    polylines,
    markers,
  ];
}
