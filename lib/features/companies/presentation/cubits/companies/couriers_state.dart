part of 'couriers_cubit.dart';

class CompaniesState extends Equatable {
  final StateStatus status;
  final String? errorMessage;
  final List<CompanyModel> companies;

  const CompaniesState({
    required this.status,
    this.errorMessage,
    required this.companies,
  });

  factory CompaniesState.initial() =>
      CompaniesState(status: StateStatus.initial, companies: []);

  CompaniesState copyWith({
    StateStatus? status,
    String? errorMessage,
    List<CompanyModel>? companies,
  }) {
    return CompaniesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      companies: companies ?? this.companies,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, companies];
}
