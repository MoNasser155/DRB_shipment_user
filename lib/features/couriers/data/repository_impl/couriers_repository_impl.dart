import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/core/errors/firebase_failuer.dart';
import 'package:drb_shipment_user/features/couriers/data/models/courier_model.dart';
import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repository/couriers_repository.dart';
import '../data_sources/couriers_data_source.dart';

class CouriersRepositoryImpl extends CouriersRepository {
  final _couriersDataSource = sl<CouriersDataSource>();
  @override
  Future<Either<Failure, List<CourierModel>>> getAllCouriers(
    String companyId,
  ) async {
    try {
      final allCouriers = await _couriersDataSource.getAllCouriers(companyId);
      return Right(allCouriers);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }

  @override
  Future<Either<Failure, List<CourierModel>>> getLimitedCouriers(
    String companyId,
  ) async {
    try {
      final allCouriers = await _couriersDataSource.getAllCouriers(companyId);
      return Right(allCouriers);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }
}
