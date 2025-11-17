import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/company_model.dart';

abstract class CompaniesRepository {
  Future<Either<Failure, List<CompanyModel>>> getCompanies();
}
