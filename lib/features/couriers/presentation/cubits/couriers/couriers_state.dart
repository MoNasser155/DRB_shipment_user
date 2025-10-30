part of 'couriers_cubit.dart';

class CouriersState extends Equatable {
  final StateStatus status;
  final String? errorMessage;
  final List<CourierModel> couriers;
  const CouriersState({
    required this.status,
    this.errorMessage,
    required this.couriers,
  });

  factory CouriersState.initial() => CouriersState(
    status: StateStatus.initial,
    errorMessage: '',
    couriers: [],
  );

  CouriersState copyWith({
    StateStatus? status,
    String? errorMessage,
    List<CourierModel>? couriers,
  }) => CouriersState(
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    couriers: couriers ?? this.couriers,
  );

  @override
  List<Object?> get props => [status, errorMessage, couriers];
}
