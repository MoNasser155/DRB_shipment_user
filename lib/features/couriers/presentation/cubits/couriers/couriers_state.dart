part of 'couriers_cubit.dart';

class CouriersState extends Equatable {
  final StateStatus status;
  final String? errorMessage;
  final List<CouriersCompanyModel> companies;

  const CouriersState({
    required this.status,
    this.errorMessage,
    required this.companies,
  });

  factory CouriersState.initial() =>
      CouriersState(status: StateStatus.initial, companies: []);

  CouriersState copyWith({
    StateStatus? status,
    String? errorMessage,
    List<CouriersCompanyModel>? companies,
  }) {
    return CouriersState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      companies: companies ?? this.companies,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, companies];
}
