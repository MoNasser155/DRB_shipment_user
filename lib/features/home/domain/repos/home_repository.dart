import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/core/error/failures.dart';

import '../../../couriers/data/models/couriers_company_model.dart';
import '../../../packages/data/models/packages_model.dart';
import '../../data/models/ads_banner_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<AdsBannerModel>>> getAds();
  Future<Either<Failure, List<PackagesModel>>> getHomePackages(String uId);
  Future<Either<Failure, List<CouriersCompanyModel>>> getHomeCouriersCompanies();
}
