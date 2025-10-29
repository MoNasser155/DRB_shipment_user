import 'package:dartz/dartz.dart';
import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../../couriers/data/models/couriers_company_model.dart';
import '../repos/home_repository.dart';

class GetHomeCouriersCompanyUsecase {
  final _repository = sl<HomeRepository>();

  Future<Either<Failure, List<CouriersCompanyModel>>> call() async =>
      await _repository.getHomeCouriersCompanies();
}
