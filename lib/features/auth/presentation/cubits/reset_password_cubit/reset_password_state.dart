part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  final StateStatus status;
  const ResetPasswordState({required this.status});

  factory ResetPasswordState.initial() {
    return ResetPasswordState(status: StateStatus.initial);
  }

  ResetPasswordState copyWith({StateStatus? status}) {
    return ResetPasswordState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
