import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/features/couriers/domain/repository/couriers_repository.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/couriers_model.dart';

class GetAllCouriersUsecase {
  final _repository = sl<CouriersRepository>();

  Future<Either<Failure, List<CourierModel>>> call(String companyId) async =>
      await _repository.getAllCouriers(companyId);
}
