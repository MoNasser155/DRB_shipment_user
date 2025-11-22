import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/review_model.dart';
import '../repos/reviews_repository.dart';

class GetReviewUsecase {
  final _repository = sl<ReviewsRepository>();

  Future<Either<Failure, ReviewModel>> call({required String reviewId}) async =>
      await _repository.getReview(reviewId: reviewId);
}
