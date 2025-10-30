import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/core/error/failures.dart';
import 'package:drb_shipment_user/features/home/data/models/ads_banner_model.dart';
import 'package:drb_shipment_user/features/home/domain/repos/home_repository.dart';
import '../../../../core/constants.dart';
import '../../../companies/data/models/company_model.dart';
import '../../../packages/data/models/packages_model.dart';
import '../data_sources/home_data_source.dart';

class HomeRepositoryImpl extends HomeRepository {
  final _homeDataSource = sl<HomeDataSource>();
  @override
  Future<Either<Failure, List<AdsBannerModel>>> getAds() async {
    try {
      final adsList = await _homeDataSource.getAds();
      return Right(adsList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PackageModel>>> getHomePackages(
    String uId,
  ) async {
    try {
      final packagesList = await _homeDataSource.getHomePackages(uId);
      return Right(packagesList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CompanyModel>>> getHomeCouriersCompanies() async {
    try {
      final couriersList = await _homeDataSource.getHomeCouriersCompanies();
      return Right(couriersList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
