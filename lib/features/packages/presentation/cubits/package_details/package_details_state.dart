part of 'package_details_cubit.dart';

class PackageDetailsState extends Equatable {
  final StateStatus status;
  final UserEntity user;
  final PackagesModel packagesModel;
  final String? errorMessage;

  const PackageDetailsState({
    required this.status,
    required this.user,
    required this.packagesModel,
    this.errorMessage,
  });

  factory PackageDetailsState.initial() => PackageDetailsState(
    status: StateStatus.initial,
    user: UserEntity.initial(),
    packagesModel: PackagesModel.skeleton(),
    errorMessage: '',
  );

  PackageDetailsState copyWith({
    StateStatus? status,
    UserEntity? user,
    PackagesModel? packagesModel,
    String? errorMessage,
  }) {
    return PackageDetailsState(
      status: status ?? this.status,
      user: user ?? this.user,
      packagesModel: packagesModel ?? this.packagesModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, packagesModel, errorMessage];
}
