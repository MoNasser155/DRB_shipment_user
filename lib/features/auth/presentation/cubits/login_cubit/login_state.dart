part of 'login_cubit.dart';

class LoginState extends Equatable {
  final StateStatus status;
  final String? errorMessage;
  const LoginState({required this.status, this.errorMessage});

  factory LoginState.initial() =>
      const LoginState(status: StateStatus.initial, errorMessage: '');

  LoginState copyWith({StateStatus? status, String? errorMessage}) =>
      LoginState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );
  @override
  List<Object?> get props => [status, errorMessage];
}
