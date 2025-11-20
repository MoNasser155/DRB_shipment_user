import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/faq_model.dart';

abstract class UserAccountRepository {
  Future<Either<Failure, List<FaqModel>>> getFaqs();
}
