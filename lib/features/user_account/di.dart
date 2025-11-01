import 'package:drb_shipment_user/features/user_account/data/datasources/user_account_data_source.dart';
import 'package:drb_shipment_user/features/user_account/presentation/cubits/faq/faq_cubit.dart';

import '../../core/constants.dart';
import 'data/repo/user_account_repository_impl.dart';
import 'domain/repo/user_account_repository.dart';
import 'domain/usecases/get_faqs_usecase.dart';
import 'presentation/cubits/edit_profile/edit_profile_cubit.dart';

initUserAccountDebendencies() {
  //data sources
  sl.registerLazySingleton<UserAccountDataSource>(
    () => UserAccountDataSourceImpl(),
  );

  //repositories
  sl.registerLazySingleton<UserAccountRepository>(
    () => UserAccountRepositoryImpl(),
  );

  //usecases
  sl.registerLazySingleton(() => GetFaqsUsecase());

  //cubits
  sl.registerFactory<EditProfileCubit>(() => EditProfileCubit());
  sl.registerFactory<FaqCubit>(() => FaqCubit());
}
