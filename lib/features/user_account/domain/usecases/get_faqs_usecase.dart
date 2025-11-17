import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/faq_model.dart';
import '../repo/user_account_repository.dart';

class GetFaqsUsecase {
  final _repository = sl<UserAccountRepository>();

  Future<Either<Failure, List<FaqModel>>> call() => _repository.getFaqs();
}
