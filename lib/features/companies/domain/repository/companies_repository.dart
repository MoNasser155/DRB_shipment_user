import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/company_model.dart';

abstract class CompaniesRepository {
  Future<Either<Failure, List<CompanyModel>>> getCompanies();
}
