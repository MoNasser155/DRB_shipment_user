import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../companies/data/models/company_model.dart';
import '../../../packages/data/models/packages_model.dart';
import '../../data/models/ads_banner_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<AdsBannerModel>>> getAds();
  Future<Either<Failure, List<PackageModel>>> getHomePackages(String userId);
  Future<Either<Failure, List<CompanyModel>>> getHomeCouriersCompanies();
}
