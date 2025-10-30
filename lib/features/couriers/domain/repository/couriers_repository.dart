import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/couriers_company_model.dart';

abstract class CouriersRepository {
  Future<Either<Failure, List<CouriersCompanyModel>>>
  getCouriersCompanies();
}
