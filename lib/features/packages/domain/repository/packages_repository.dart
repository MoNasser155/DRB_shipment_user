import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../companies/data/models/company_model.dart';
import '../../../couriers/data/models/courier_model.dart';
import '../../data/models/packages_model.dart';

abstract class PackagesRepository {
  Future<Either<Failure, List<PackageModel>>> getPackages(
    String uId, {
    String? status,
  });

  Future<Either<Failure, UserEntity>> getSenderById(String uId);
  Future<Either<Failure, CourierModel>> getCourierById(String uId);
  Future<Either<Failure, CompanyModel>> getCompanyById(String uId);
}
