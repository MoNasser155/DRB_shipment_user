import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants.dart';
import '../models/review_model.dart';

abstract class ReviewsDataSource {
  Future<void> addReview({required ReviewModel review});
  Future<ReviewModel> getReview({required String reviewId});
  Future<List<ReviewModel>> getAllReviews({required String userId});
}

class ReviewsDataSourceImpl implements ReviewsDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addReview({required ReviewModel review}) async {
    final reviewData = await _firestore
        .collection(Collections.reviews)
        .add(review.toFirestore());
    await _firestore
        .collection(Collections.packages)
        .doc(review.packageId)
        .update({'review_id': reviewData.id});
  }

  @override
  Future<ReviewModel> getReview({required String reviewId}) async {
    final review =
        await _firestore.collection(Collections.reviews).doc(reviewId).get();
    return ReviewModel.fromFirestore({...review.data()!, 'id': review.id});
  }

  @override
  Future<List<ReviewModel>> getAllReviews({required String userId}) async {
    final reviews =
        await _firestore
            .collection(Collections.reviews)
            .where('user_id', isEqualTo: userId)
            .get();
    return reviews.docs
        .map((doc) => ReviewModel.fromFirestore({...doc.data(), 'id': doc.id}))
        .toList();
  }
}
