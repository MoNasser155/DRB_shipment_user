import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/core/error/failures.dart';
import 'package:drb_shipment_user/features/couriers/data/models/couriers_model.dart';
import '../../../../core/constants.dart';
import '../../domain/repository/couriers_repository.dart';
import '../data_sources/couriers_data_source.dart';

class CouriersRepositoryImpl extends CouriersRepository {
  final _couriersDataSource = sl<CouriersDataSource>();
  @override
  Future<Either<Failure, List<CouriersModel>>> getAllCouriers(
    String companyId,
  ) async {
    try {
      final allCouriers = await _couriersDataSource.getAllCouriers(companyId);
      return Right(allCouriers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CouriersModel>>> getLimitedCouriers(
    String companyId,
  ) async {
    try {
      final allCouriers = await _couriersDataSource.getAllCouriers(companyId);
      return Right(allCouriers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
