import 'package:dartz/dartz.dart';

import 'package:drb_shipment_user/core/error/failures.dart';
import 'package:drb_shipment_user/features/couriers/data/data_sources/couriers_data_source.dart';

import 'package:drb_shipment_user/features/couriers/data/models/couriers_company_model.dart';

import '../../../../core/constants.dart';
import '../../domain/repository/couriers_repository.dart';

class CouriersRepositoryImpl extends CouriersRepository {
  final _couriersDataSource = sl<CouriersDataSource>();
  @override
  Future<Either<Failure, List<CouriersCompanyModel>>>
  getCouriersCompanies() async {
    try {
      final couriersList = await _couriersDataSource.getCouriersCompanies();
      return Right(couriersList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
