part of 'main_view_cubit.dart';

class MainViewState extends Equatable {
  final StateStatus status;
  final int selectedTabIndex;

  const MainViewState({required this.status, required this.selectedTabIndex});

  factory MainViewState.initial() =>
      MainViewState(status: StateStatus.initial, selectedTabIndex: 0);

  MainViewState copyWith({StateStatus? status, int? selectedTabIndex}) {
    return MainViewState(
      status: status ?? this.status,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

  @override
  List<Object> get props => [status, selectedTabIndex];
}
