import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/couriers_model.dart';

abstract class CouriersRepository {
  Future<Either<Failure, List<CouriersModel>>> getAllCouriers(String companyId);
  Future<Either<Failure, List<CouriersModel>>> getLimitedCouriers(String companyId);
}
