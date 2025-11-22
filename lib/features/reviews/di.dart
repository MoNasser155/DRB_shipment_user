import 'package:drb_shipment_user/features/reviews/data/data_source/reviews_data_source.dart';

import '../../core/constants.dart';
import 'data/repo_impl/reviews_repository_impl.dart';
import 'domain/repos/reviews_repository.dart';
import 'domain/usecases/add_review_usecase.dart';
import 'domain/usecases/get_all_reviews_usecase.dart';
import 'domain/usecases/get_review_usecase.dart';

initReviewsDI() {
  // data sources
  sl.registerLazySingleton<ReviewsDataSource>(() => ReviewsDataSourceImpl());

  // repositories
  sl.registerLazySingleton<ReviewsRepository>(() => ReviewsRepositoryImpl());

  // usecases
  sl.registerLazySingleton(() => GetAllReviewsUsecase());
  sl.registerLazySingleton(() => GetReviewUsecase());
  sl.registerLazySingleton(() => AddReviewUsecase());

  //cubits
}
