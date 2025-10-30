import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/company_model.dart';
import '../repository/companies_repository.dart';

class GetCompaniesUsecase {
  final _repository = sl<CompaniesRepository>();

  Future<Either<Failure, List<CompanyModel>>> call() async {
    return await _repository.getCompanies();
  }
}
