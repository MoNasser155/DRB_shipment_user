import 'package:dartz/dartz.dart';
import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/firebase_failuer.dart';
import '../../domain/repository/companies_repository.dart';
import '../data_sources/companies_data_source.dart';
import '../models/company_model.dart';

class CompaniesRepositoryImpl extends CompaniesRepository {
  final _couriersDataSource = sl<CompaniesDataSource>();
  @override
  Future<Either<Failure, List<CompanyModel>>> getCompanies() async {
    try {
      final couriersList = await _couriersDataSource.getCompanies();
      return Right(couriersList);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }
}
