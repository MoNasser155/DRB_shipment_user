part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final StateStatus status;
  final String? errorMessage;
  const SignupState({required this.status, this.errorMessage});

  factory SignupState.initial() =>
      const SignupState(status: StateStatus.initial);

  SignupState copyWith({StateStatus? status, String? errorMessage}) =>
      SignupState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );
  @override
  List<Object?> get props => [status, errorMessage];
}
