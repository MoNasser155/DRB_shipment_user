part of 'home_cubit.dart';

class HomeState extends Equatable {
  final StateStatus status;
  final UserEntity user;
  final String date;
  final List<AdsBannerModel> adsList;
  const HomeState({
    required this.status,
    required this.user,
    required this.date,
    required this.adsList,
  });

  factory HomeState.initial() => HomeState(
    status: StateStatus.initial,
    user: UserEntity.initial(),
    date: '',
    adsList: [],
  );
  HomeState copyWith({
    StateStatus? status,
    UserEntity? user,
    String? date,
    List<AdsBannerModel>? adsList,
  }) => HomeState(
    status: status ?? this.status,
    user: user ?? this.user,
    date: date ?? this.date,
    adsList: adsList ?? this.adsList,
  );

  @override
  List<Object> get props => [status, user, date, adsList];
}
