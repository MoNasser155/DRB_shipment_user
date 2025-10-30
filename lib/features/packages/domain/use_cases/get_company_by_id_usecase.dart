import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../../companies/data/models/company_model.dart';
import '../repository/packages_repository.dart';

class GetCompanyByIdUsecase {
  final _repository = sl<PackagesRepository>();

  Future<Either<Failure, CompanyModel>> call(String companyId) async =>
      await _repository.getCompanyById(companyId);
}
