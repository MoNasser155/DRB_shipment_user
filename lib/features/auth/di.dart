import '../../core/constants.dart';
import 'data/data_sources/auth_data_source.dart';
import 'data/repos_impl/auth_repository_impl.dart';
import 'domain/repos/auth_repository.dart';
import 'domain/use_cases/get_user_from_storage_usecase.dart';
import 'domain/use_cases/login_usecase.dart';
import 'domain/use_cases/reset_password_usecase.dart';
import 'domain/use_cases/signup_usecase.dart';
import 'presentation/cubits/login_cubit/login_cubit.dart';
import 'presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'presentation/cubits/signup_cubit/signup_cubit.dart';

initAuthDI() {
  //data sources
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());

  //repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  //usecases
  sl.registerLazySingleton(() => SignupUsecase());
  sl.registerLazySingleton(() => LoginUsecase());
  sl.registerLazySingleton(() => ResetPasswordUsecase());
  sl.registerLazySingleton(() => GetUserFromStorageUsecase());

  // cubits
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => SignupCubit());
  sl.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit());
}
