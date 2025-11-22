import 'package:dartz/dartz.dart';

import 'package:drb_shipment_user/core/errors/failures.dart';

import 'package:drb_shipment_user/features/reviews/data/models/review_model.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/firebase_failuer.dart';
import '../../domain/repos/reviews_repository.dart';
import '../data_source/reviews_data_source.dart';

class ReviewsRepositoryImpl extends ReviewsRepository {
  final _reviewDataSource = sl<ReviewsDataSource>();

  @override
  Future<Either<Failure, void>> addReview({required ReviewModel review}) async {
    try {
      final package = await _reviewDataSource.addReview(review: review);
      return Right(package);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }

  @override
  Future<Either<Failure, List<ReviewModel>>> getAllReviews({
    required String userId,
  }) async {
    try {
      final reviews = await _reviewDataSource.getAllReviews(userId: userId);
      return Right(reviews);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }

  @override
  Future<Either<Failure, ReviewModel>> getReview({
    required String reviewId,
  }) async {
    try {
      final review = await _reviewDataSource.getReview(reviewId: reviewId);
      return Right(review);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }
}
