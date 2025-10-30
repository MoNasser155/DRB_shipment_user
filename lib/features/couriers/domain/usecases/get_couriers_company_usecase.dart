import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/couriers_company_model.dart';
import '../repository/couriers_repository.dart';

class GetCouriersCompanyUsecase {
  final _repository = sl<CouriersRepository>();

  Future<Either<Failure, List<CouriersCompanyModel>>> call() async {
    return await _repository.getCouriersCompanies();
  }
}
