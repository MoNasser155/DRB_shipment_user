import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/couriers_model.dart';
import '../repository/couriers_repository.dart';

class GetLimitedCouriersUsecase {
  final _repository = sl<CouriersRepository>();

  Future<Either<Failure, List<CouriersModel>>> call(String companyId) async =>
      await _repository.getLimitedCouriers(companyId);
}
