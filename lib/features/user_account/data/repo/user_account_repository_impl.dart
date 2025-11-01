import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/features/user_account/domain/repo/user_account_repository.dart';
import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../datasources/user_account_data_source.dart';
import '../models/faq_model.dart';

class UserAccountRepositoryImpl extends UserAccountRepository {
  final _userAccountDataSource = sl<UserAccountDataSource>();

  @override
  Future<Either<Failure, List<FaqModel>>> getFaqs() async {
    try {
      final faqs = await _userAccountDataSource.getFaqs();
      return Right(faqs);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
