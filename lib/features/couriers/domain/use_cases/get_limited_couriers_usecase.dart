import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/courier_model.dart';
import '../repository/couriers_repository.dart';

class GetLimitedCouriersUsecase {
  final _repository = sl<CouriersRepository>();

  Future<Either<Failure, List<CourierModel>>> call(String companyId) async =>
      await _repository.getLimitedCouriers(companyId);
}
