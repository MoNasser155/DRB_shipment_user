part of 'company_details_cubit.dart';

class CompanyDetailsState extends Equatable {
  final StateStatus status;
  final CompanyModel companyModel;
  final int? maxDescriptionLines;
  final List<CourierModel> couriers;
  final String? errorMessage;

  const CompanyDetailsState({
    required this.status,
    required this.companyModel,
    this.maxDescriptionLines,
    required this.couriers,
    this.errorMessage,
  });
  factory CompanyDetailsState.initial() {
    return CompanyDetailsState(
      status: StateStatus.initial,
      companyModel: CompanyModel.skeleton(),
      maxDescriptionLines: 2,
      couriers: [],
    );
  }

  CompanyDetailsState copyWith({
    StateStatus? status,
    CompanyModel? companyModel,
    int? maxDescriptionLines,
    List<CourierModel>? couriers,
    String? errorMessage,
  }) {
    return CompanyDetailsState(
      status: status ?? this.status,
      companyModel: companyModel ?? this.companyModel,
      maxDescriptionLines: maxDescriptionLines ?? this.maxDescriptionLines,
      couriers: couriers ?? this.couriers,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    companyModel,
    maxDescriptionLines,
    couriers,
    errorMessage,
  ];
}
