part of 'packages_cubit.dart';

class PackagesState extends Equatable {
  final StateStatus status;
  final List<PackageModel> packages;
  final int selectedTabIndex;
  final UserEntity user;
  const PackagesState({
    required this.status,
    required this.packages,
    required this.selectedTabIndex,
    required this.user,
  });

  factory PackagesState.initial() {
    return PackagesState(
      status: StateStatus.initial,
      packages: const [],
      selectedTabIndex: 0,
      user: UserEntity.initial(),
    );
  }

  PackagesState copyWith({
    StateStatus? status,
    List<PackageModel>? packages,
    UserEntity? user,
    int? selectedTabIndex,
  }) {
    return PackagesState(
      status: status ?? this.status,
      packages: packages ?? this.packages,
      user: user ?? this.user,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

  @override
  List<Object> get props => [status, packages, selectedTabIndex, user];
}
