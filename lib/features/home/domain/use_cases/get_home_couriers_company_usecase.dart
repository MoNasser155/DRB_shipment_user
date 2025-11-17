import 'package:dartz/dartz.dart';
import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../companies/data/models/company_model.dart';
import '../repos/home_repository.dart';

class GetHomeCouriersCompanyUsecase {
  final _repository = sl<HomeRepository>();

  Future<Either<Failure, List<CompanyModel>>> call() async =>
      await _repository.getHomeCouriersCompanies();
}
