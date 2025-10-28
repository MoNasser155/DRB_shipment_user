import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/core/error/failures.dart';

import '../../data/models/ads_banner_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<AdsBannerModel>>> getAds();
}
