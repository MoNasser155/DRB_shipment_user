import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/review_model.dart';
import '../repos/reviews_repository.dart';

class GetAllReviewsUsecase {
  final _repository = sl<ReviewsRepository>();

  Future<Either<Failure, List<ReviewModel>>> call({
    required String userId,
  }) async => await _repository.getAllReviews(userId: userId);
}
