import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/review_model.dart';
import '../repos/reviews_repository.dart';

class AddReviewUsecase {
  final _repository = sl<ReviewsRepository>();

  Future<Either<Failure, void>> call({required ReviewModel review}) async =>
      await _repository.addReview(review: review);
}
