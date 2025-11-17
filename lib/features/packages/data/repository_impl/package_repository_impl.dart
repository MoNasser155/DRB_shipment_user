import 'package:dartz/dartz.dart';
import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/firebase_failuer.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../companies/data/models/company_model.dart';
import '../../../couriers/data/models/courier_model.dart';
import '../../domain/repository/packages_repository.dart';
import '../data_source/packages_data_source.dart';
import '../models/packages_model.dart';

class PackageRepositoryImpl extends PackagesRepository {
  final _packagesDataSource = sl<PackagesDataSource>();
  @override
  Future<Either<Failure, List<PackageModel>>> getPackages(
    String uId, {
    String? status,
  }) async {
    try {
      final packagesList = await _packagesDataSource.getPackages(
        uId,
        status: status,
      );
      return Right(packagesList);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getSenderById(String senderId) async {
    try {
      final user = await _packagesDataSource.getSenderById(senderId);
      return Right(user);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }

  @override
  Future<Either<Failure, CourierModel>> getCourierById(String courierId) async {
    try {
      final courier = await _packagesDataSource.getCourierById(courierId);
      return Right(courier);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }

  @override
  Future<Either<Failure, CompanyModel>> getCompanyById(String companyId) async {
    try {
      final company = await _packagesDataSource.getCompanyById(companyId);
      return Right(company);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }
}
