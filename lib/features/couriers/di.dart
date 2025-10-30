import '../../core/constants.dart';
import 'data/data_sources/couriers_data_source.dart';
import 'data/repository_impl/couriers_repository_impl.dart';
import 'domain/repository/couriers_repository.dart';
import 'domain/use_cases/get_all_couriers_usecase.dart';
import 'domain/use_cases/get_limited_couriers_usecase.dart';
import 'presentation/cubits/couriers/couriers_cubit.dart';

initCouriersDebendencies() {
  //data sources
  sl.registerLazySingleton<CouriersDataSource>(() => CouriersDataSourceImpl());

  //repositories
  sl.registerLazySingleton<CouriersRepository>(() => CouriersRepositoryImpl());

  //usecases
  sl.registerLazySingleton(() => GetAllCouriersUsecase());
  sl.registerLazySingleton(() => GetLimitedCouriersUsecase());

  //cubits
  sl.registerFactory<CouriersCubit>(() => CouriersCubit());
}
