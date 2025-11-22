import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/review_model.dart';

abstract class ReviewsRepository {
  Future<Either<Failure, void>> addReview({required ReviewModel review});
  Future<Either<Failure, ReviewModel>> getReview({required String reviewId});
  Future<Either<Failure, List<ReviewModel>>> getAllReviews({required String userId});
}
