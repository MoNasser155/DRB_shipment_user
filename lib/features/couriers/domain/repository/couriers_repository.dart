import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/courier_model.dart';

abstract class CouriersRepository {
  Future<Either<Failure, List<CourierModel>>> getAllCouriers(String companyId);
  Future<Either<Failure, List<CourierModel>>> getLimitedCouriers(
    String companyId,
  );
}
