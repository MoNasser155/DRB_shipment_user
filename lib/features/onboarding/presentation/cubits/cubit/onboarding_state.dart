part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  final StateStatus status;
  final int currentPage;
  final bool isLastPage;

  const OnboardingState({
    required this.currentPage,
    required this.status,
    required this.isLastPage,
  });

  factory OnboardingState.initial() => const OnboardingState(
    currentPage: 0,
    status: StateStatus.initial,
    isLastPage: false,
  );

  OnboardingState copyWith({
    int? currentPage,
    StateStatus? status,
    bool? isLastPage,
  }) => OnboardingState(
    currentPage: currentPage ?? this.currentPage,
    status: status ?? this.status,
    isLastPage: isLastPage ?? this.isLastPage,
  );

  @override
  List<Object> get props => [currentPage, status, isLastPage];
}
