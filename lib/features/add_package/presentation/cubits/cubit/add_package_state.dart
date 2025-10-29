part of 'add_package_cubit.dart';

class AddPackageState extends Equatable {
  final StateStatus status;
  final UserEntity user;
  final String? errorMessage;
  final int currentPageIndex;
  final bool isFragile;
    final bool isLastPage;

  const AddPackageState({
    required this.status,
    required this.user,
    required this.isFragile,
    required this.currentPageIndex,
    required this.isLastPage,
    this.errorMessage,
  });

  factory AddPackageState.initial() => AddPackageState(
    status: StateStatus.initial,
    user: UserEntity.initial(),
    isFragile: true,
    currentPageIndex: 0,
    isLastPage: false,
  );

  AddPackageState copyWith({
    StateStatus? status,
    UserEntity? user,
    String? errorMessage,
    int? currentPageIndex,
    bool? isFragile,
    bool? isLastPage,
  }) {
    return AddPackageState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      isFragile: isFragile ?? this.isFragile,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    user,
    currentPageIndex,
    errorMessage,
    isFragile,
    isLastPage
  ];
}
