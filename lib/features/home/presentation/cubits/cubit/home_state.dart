part of 'home_cubit.dart';

class HomeState extends Equatable {
  final StateStatus status;
  final UserEntity user;
  final String date;
  final List<AdsBannerModel> adsList;
  final List<PackagesModel> packagesList;
  final List<CouriersCompanyModel> couriersCompany;
  const HomeState({
    required this.status,
    required this.user,
    required this.date,
    required this.adsList,
    required this.packagesList,
    required this.couriersCompany,
  });

  factory HomeState.initial() => HomeState(
    status: StateStatus.initial,
    user: UserEntity.initial(),
    date: '',
    adsList: [],
    packagesList: [],
    couriersCompany: [],
  );
  HomeState copyWith({
    StateStatus? status,
    UserEntity? user,
    String? date,
    List<AdsBannerModel>? adsList,
    List<PackagesModel>? packagesList,
    List<CouriersCompanyModel>? couriersCompany,
  }) => HomeState(
    status: status ?? this.status,
    user: user ?? this.user,
    date: date ?? this.date,
    adsList: adsList ?? this.adsList,
    packagesList: packagesList ?? this.packagesList,
    couriersCompany: couriersCompany ?? this.couriersCompany,
  );

  @override
  List<Object> get props => [
    status,
    user,
    date,
    adsList,
    packagesList,
    couriersCompany,
  ];
}
