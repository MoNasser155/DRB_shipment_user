import 'package:dartz/dartz.dart';

import 'package:drb_shipment_user/core/error/failures.dart';

import 'package:drb_shipment_user/features/auth/domain/entities/user_entity.dart';
import 'package:drb_shipment_user/features/packages/data/data_source/packages_data_source.dart';

import 'package:drb_shipment_user/features/packages/data/models/packages_model.dart';

import '../../../../core/constants.dart';
import '../../../companies/data/models/company_model.dart';
import '../../../couriers/data/models/courier_model.dart';
import '../../domain/repository/packages_repository.dart';

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
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getSenderById(String senderId) async {
    try {
      final user = await _packagesDataSource.getSenderById(senderId);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CourierModel>> getCourierById(String courierId) async {
    try {
      final courier = await _packagesDataSource.getCourierById(courierId);
      return Right(courier);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CompanyModel>> getCompanyById(String companyId) async {
    try {
      final company = await _packagesDataSource.getCompanyById(companyId);
      return Right(company);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
