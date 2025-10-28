import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/ads_banner_model.dart';
import '../repos/home_repository.dart';

class GetAdsUsecase {
  final _repository = sl<HomeRepository>();

  Future<Either<Failure, List<AdsBannerModel>>> call() => _repository.getAds();
}
