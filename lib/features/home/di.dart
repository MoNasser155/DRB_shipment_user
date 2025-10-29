import 'package:drb_shipment_user/features/home/data/data_sources/home_data_source.dart';

import '../../core/constants.dart';
import 'data/repo_impl/home_repository_impl.dart';
import 'domain/repos/home_repository.dart';
import 'domain/use_cases/get_ads_usecase.dart';
import 'domain/use_cases/get_home_packages.dart';
import 'presentation/cubits/cubit/home_cubit.dart';

initHomeDebendencies() {
  //data sources
  sl.registerLazySingleton<HomeDataSource>(()=> HomeDataSourceImpl());

  //repositories
  sl.registerLazySingleton<HomeRepository>(()=> HomeRepositoryImpl());

  //usecases
  sl.registerLazySingleton(() => GetAdsUsecase());
  sl.registerLazySingleton(() => GetHomePackages());

  //cubits 
  sl.registerFactory<HomeCubit>(() => HomeCubit());
}
