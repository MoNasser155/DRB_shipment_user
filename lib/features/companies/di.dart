import '../../core/constants.dart';
import 'data/data_sources/companies_data_source.dart';
import 'data/repository_impl/companies_repository_impl.dart';
import 'domain/repository/companies_repository.dart';
import 'domain/usecases/get_companies_usecase.dart';
import 'presentation/cubits/companies/couriers_cubit.dart';
import 'presentation/cubits/company_details/company_details_cubit.dart';

initCompaniesDI() {
  //data sources
  sl.registerLazySingleton<CompaniesDataSource>(
    () => CompaniesDataSourceImpl(),
  );

  //repositories
  sl.registerLazySingleton<CompaniesRepository>(
    () => CompaniesRepositoryImpl(),
  );

  //usecases
  sl.registerLazySingleton(() => GetCompaniesUsecase());

  //cubits
  sl.registerFactory<CompaniesCubit>(() => CompaniesCubit());
  sl.registerFactory<CompanyDetailsCubit>(() => CompanyDetailsCubit());
}
