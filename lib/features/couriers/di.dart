import '../../core/constants.dart';
import 'data/data_sources/couriers_data_source.dart';
import 'data/repository_impl/couriers_repository_impl.dart';
import 'domain/repository/couriers_repository.dart';
import 'domain/usecases/get_couriers_company_usecase.dart';
import 'presentation/cubits/couriers/couriers_cubit.dart';

initCouriersDebendencies() {
  //data sources
  sl.registerLazySingleton<CouriersDataSource>(() => CouriersDataSourceImpl());

  //repositories
  sl.registerLazySingleton<CouriersRepository>(() => CouriersRepositoryImpl());

  //usecases
  sl.registerLazySingleton(() => GetCouriersCompanyUsecase());

  //cubits
  sl.registerFactory<CouriersCubit>(() => CouriersCubit());
}
