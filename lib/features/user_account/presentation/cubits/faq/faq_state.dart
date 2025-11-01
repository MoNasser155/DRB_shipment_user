part of 'faq_cubit.dart';

class FaqState extends Equatable {
  final List<FaqModel> faqs;
  final StateStatus status;
  const FaqState({required this.faqs, required this.status});

  factory FaqState.initial() =>
      const FaqState(faqs: [], status: StateStatus.initial);

  FaqState copyWith({List<FaqModel>? faqs, StateStatus? status}) {
    return FaqState(faqs: faqs ?? this.faqs, status: status ?? this.status);
  }

  @override
  List<Object> get props => [faqs, status];
}
