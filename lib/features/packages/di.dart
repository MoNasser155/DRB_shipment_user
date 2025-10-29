import 'package:drb_shipment_user/core/constants.dart';


import 'data/data_source/packages_data_source.dart';
import 'data/repository_impl/package_repository_impl.dart';
import 'domain/repository/packages_repository.dart';
import 'domain/use_cases/get_packages_usecase.dart';
import 'domain/use_cases/get_sender_by_id_usecase.dart';
import 'presentation/cubits/Packages/packages_cubit.dart';
import 'presentation/cubits/package_details/package_details_cubit.dart';

initPackagesDebendencies() {
  // data source
  sl.registerLazySingleton<PackagesDataSource>(() => PackagesDataSourceImpl());

  // repositories
  sl.registerLazySingleton<PackagesRepository>(() => PackageRepositoryImpl());

  //usecases
  sl.registerLazySingleton(() => GetPackagesUsecase());
  sl.registerLazySingleton(() => GetSenderByIdUsecase());

  // cubits
  sl.registerFactory<PackagesCubit>(() => PackagesCubit());
  sl.registerFactory<PackageDetailsCubit>(() => PackageDetailsCubit());
}
