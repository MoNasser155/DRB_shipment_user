import 'package:dartz/dartz.dart';

import 'package:drb_shipment_user/core/error/failures.dart';
import 'package:drb_shipment_user/features/companies/data/data_sources/companies_data_source.dart';

import 'package:drb_shipment_user/features/companies/data/models/company_model.dart';

import '../../../../core/constants.dart';
import '../../domain/repository/companies_repository.dart';

class CompaniesRepositoryImpl extends CompaniesRepository {
  final _couriersDataSource = sl<CompaniesDataSource>();
  @override
  Future<Either<Failure, List<CompanyModel>>> getCompanies() async {
    try {
      final couriersList = await _couriersDataSource.getCompanies();
      return Right(couriersList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
