part of 'add_package_cubit.dart';

class AddPackageState extends Equatable {
  final StateStatus status;
  final UserEntity user;
  final String? errorMessage;
  final int currentPageIndex;
  final bool isFragile;
  final bool isLastPage;

  final  Coordinates? pickupLocation;
  final  Coordinates? dropoffLocation;

  const AddPackageState({
    required this.status,
    required this.user,
    required this.isFragile,
    required this.currentPageIndex,
    required this.isLastPage,
    this.errorMessage,

     this.pickupLocation ,
     this.dropoffLocation ,
  });

  factory AddPackageState.initial() => AddPackageState(
    status: StateStatus.initial,
    user: UserEntity.initial(),
    isFragile: true,
    currentPageIndex: 0,
    isLastPage: false,
     pickupLocation: null,
     dropoffLocation: null,
  );

  AddPackageState copyWith({
    StateStatus? status,
    UserEntity? user,
    String? errorMessage,
    int? currentPageIndex,
    bool? isFragile,
    bool? isLastPage,

    Coordinates? pickupLocation,
    Coordinates? dropoffLocation,
  }) {
    return AddPackageState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      isFragile: isFragile ?? this.isFragile,
      isLastPage: isLastPage ?? this.isLastPage,

      pickupLocation: pickupLocation ?? this.pickupLocation,
      dropoffLocation: dropoffLocation ?? this.dropoffLocation,
    );
  }

  @override
  List<Object?> get props => [
    status,
    user,
    currentPageIndex,
    errorMessage,
    isFragile,
    isLastPage,

    pickupLocation,
    dropoffLocation,
  ];
}
