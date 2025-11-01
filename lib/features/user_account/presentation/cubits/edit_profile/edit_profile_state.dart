part of 'edit_profile_cubit.dart';

class EditProfileState extends Equatable {
  final StateStatus status;
  final UserEntity user; 
  final String ? errorMessage;
  const EditProfileState({
    required this.status,
    required this.user,
    this.errorMessage,
  });

  factory EditProfileState.initial() =>  EditProfileState(
        status: StateStatus.initial,
        user: UserEntity.initial(),
      );

  EditProfileState copyWith({
    StateStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];
}
