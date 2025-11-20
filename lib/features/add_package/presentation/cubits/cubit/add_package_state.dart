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
  final DeliveryType selectedDeliveryType;

  final GovernmentsData pickUpGovernorate;
  final Cities pickUpCity;
  final GovernmentsData dropOffGovernorate;
  final Cities dropOffCity;

  final List<CompanyModel> companies;
  final CompanyModel selectedCompany;

  final List<CourierModel> couriers;
  final CourierModel selectedCourier;

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
    required this.selectedDeliveryType,

    required this.pickUpGovernorate,
    required this.pickUpCity,
    required this.dropOffGovernorate,
    required this.dropOffCity,
    required this.companies,
    required this.selectedCompany,

    required this.couriers,
    required this.selectedCourier,
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
    selectedDeliveryType: DeliveryType.regular,
    governmentsModel: BaseGovernmentsModel.initial(),
    pickUpGovernorate: GovernmentsData.initial(),
    pickUpCity: Cities.initial(),
    dropOffGovernorate: GovernmentsData.initial(),
    dropOffCity: Cities.initial(),
    companies: [],
    selectedCompany: CompanyModel.skeleton(),
    couriers: [],
    selectedCourier: CourierModel.skeleton(),
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
    DeliveryType? selectedDeliveryType,

    GovernmentsData? pickUpGovernorate,
    Cities? pickUpCity,
    GovernmentsData? dropOffGovernorate,
    Cities? dropOffCity,

    List<CompanyModel>? companies,
    CompanyModel? selectedCompany,

    List<CourierModel>? couriers,
    CourierModel? selectedCourier,
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
      selectedDeliveryType: selectedDeliveryType ??this. selectedDeliveryType,

      pickUpGovernorate: pickUpGovernorate ?? this.pickUpGovernorate,
      pickUpCity: pickUpCity ?? this.pickUpCity,
      dropOffGovernorate: dropOffGovernorate ?? this.dropOffGovernorate,
      dropOffCity: dropOffCity ?? this.dropOffCity,

      companies: companies ?? this.companies,
      selectedCompany: selectedCompany ?? this.selectedCompany,

      couriers: couriers ?? this.couriers,
      selectedCourier: selectedCourier ?? this.selectedCourier,
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
    selectedDeliveryType,

    pickUpGovernorate,
    pickUpCity,
    dropOffGovernorate,
    dropOffCity,

    companies.length,
    selectedCompany.name,

    couriers.length,
    selectedCourier.name,
  ];
}
