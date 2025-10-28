part of 'main_view_cubit.dart';

class MainViewState extends Equatable {
  final StateStatus status;
  final int selectedTabIndex;
  final UserEntity user;

  const MainViewState({required this.status, required this.selectedTabIndex, required this.user});

  factory MainViewState.initial() =>
      MainViewState(status: StateStatus.initial, selectedTabIndex: 0, user: UserEntity.initial());

  MainViewState copyWith({StateStatus? status, int? selectedTabIndex , UserEntity? user}) {
    return MainViewState(
      status: status ?? this.status,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status, selectedTabIndex, user];
}
