part of 'add_package_cubit.dart';

class AddPackageState extends Equatable {
  final StateStatus status;
  final UserEntity user;
  final String? errorMessage;
  final int currentPageIndex;
  final bool isFragile;
  final bool isLastPage;

  final Coordinates? pickupLocation;
  final Coordinates? dropoffLocation;
  final Payment selectedPaymentMethod;
  final BaseGovernmentsModel governmentsModel;
  final GovernmentsData pickUpGovernorate;
  final Cities pickUpCity;
  final GovernmentsData dropOffGovernorate;
  final Cities dropOffCity;

  const AddPackageState({
    required this.status,
    required this.user,
    required this.isFragile,
    required this.currentPageIndex,
    required this.isLastPage,
    this.errorMessage,
    required this.governmentsModel,

    this.pickupLocation,
    this.dropoffLocation,
    required this.selectedPaymentMethod,

    required this.pickUpGovernorate,
    required this.pickUpCity,
    required this.dropOffGovernorate,
    required this.dropOffCity,
  });

  factory AddPackageState.initial() => AddPackageState(
    status: StateStatus.initial,
    user: UserEntity.initial(),
    isFragile: true,
    currentPageIndex: 0,
    isLastPage: false,
    pickupLocation: null,
    dropoffLocation: null,
    selectedPaymentMethod: Payment.cash,
    governmentsModel: BaseGovernmentsModel.initial(),
    pickUpGovernorate: GovernmentsData.initial(),
    pickUpCity: Cities.initial(),
    dropOffGovernorate: GovernmentsData.initial(),
    dropOffCity: Cities.initial(),
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
    BaseGovernmentsModel? governmentsModel,
    Payment? selectedPaymentMethod,

    GovernmentsData? pickUpGovernorate,
    Cities? pickUpCity,
    GovernmentsData? dropOffGovernorate,
    Cities? dropOffCity,
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
      governmentsModel: governmentsModel ?? this.governmentsModel,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,

      pickUpGovernorate: pickUpGovernorate ?? this.pickUpGovernorate,
      pickUpCity: pickUpCity ?? this.pickUpCity,
      dropOffGovernorate: dropOffGovernorate ?? this.dropOffGovernorate,
      dropOffCity: dropOffCity ?? this.dropOffCity,
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
    selectedPaymentMethod,
    governmentsModel,

    pickUpGovernorate,
    pickUpCity,
    dropOffGovernorate,
    dropOffCity,
  ];
}
