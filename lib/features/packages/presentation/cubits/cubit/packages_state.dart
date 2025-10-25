part of 'packages_cubit.dart';

 class PackagesState extends Equatable {
  final StateStatus status;
  final int selectedTabIndex ;
  const PackagesState({
    required this.status,
    required this.selectedTabIndex
  });

  factory PackagesState.initial() {
    return const PackagesState(status: StateStatus.initial , selectedTabIndex: 0);
  }

  PackagesState copyWith({
    StateStatus? status,
    int? selectedTabIndex
  }) {
    return PackagesState(
      status: status ?? this.status,
      selectedTabIndex: selectedTabIndex?? this.selectedTabIndex
    );
  }

  @override
  List<Object> get props => [status , selectedTabIndex];
}


