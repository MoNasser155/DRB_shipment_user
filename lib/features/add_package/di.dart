import '../../core/constants.dart';
import 'data/data_sources/add_package_data_source.dart';
import 'data/repository_impl/add_package_repository_impl.dart';
import 'domain/repository/add_package_repository.dart';
import 'domain/usecases/add_package_usecase.dart';
import 'presentation/cubits/cubit/add_package_cubit.dart';

initAddPackageDebendencies() {
  //data sources
  sl.registerLazySingleton<AddPackageDataSource>(()=> AddPackageDataSourceImpl());

  //repositories
  sl.registerLazySingleton<AddPackageRepository>(()=> AddPackageRepositoryImpl());

  //usecases
  sl.registerLazySingleton(()=> AddPackageUsecase()); 
  
  //cubits
  sl.registerFactory<AddPackageCubit>(() => AddPackageCubit());
}
