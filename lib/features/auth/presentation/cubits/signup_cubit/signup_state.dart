part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final StateStatus status;
  final String? errorMessage;
  final bool isTermsAccepted;
  const SignupState({required this.status, this.errorMessage, required this.isTermsAccepted });

  factory SignupState.initial() =>
      const SignupState(status: StateStatus.initial, isTermsAccepted: false);

  SignupState copyWith({StateStatus? status, String? errorMessage, bool? isTermsAccepted}) =>
      SignupState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted
      );
  @override
  List<Object?> get props => [status, errorMessage, isTermsAccepted];
}
