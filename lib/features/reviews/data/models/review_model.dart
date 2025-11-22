class ReviewModel {
  final String? id;
  final String useId;
  final String comment;
  final String courierId;
  final String packageId;
  final String createdAt;
  final String? lastUpdate;
  final double _rating;

  ReviewModel({
    this.id,
    required this.useId,
    required this.comment,
    required this.courierId,
    required this.packageId,
    required this.createdAt,
    this.lastUpdate,
    required double rating,
  }) : _rating = rating;

  double get rating => _rating;
  double setRating(double rating) {
    if (rating > 5) {
      return 5;
    } else if (rating < 0) {
      return 0;
    } else {
      return rating;
    }
  }

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> map = <String, dynamic>{
      'user_id': useId,
      'comment': comment,
      'courier_id': courierId,
      'package_id': packageId,
      'created_at': createdAt,
      'last_update': lastUpdate,
      'rating': rating,
    };
    return map;
  }

  factory ReviewModel.fromFirestore(Map<String, dynamic> data) => ReviewModel(
    useId: data['user_id'],
    comment: data['comment'],
    courierId: data['courier_id'],
    packageId: data['package_id'],
    createdAt: data['created_at'],
    lastUpdate: data['last_update'],
    rating: data['rating'],
  );

  factory ReviewModel.skeleton() => ReviewModel(
    useId: '',
    comment: '',
    courierId: '',
    packageId: '',
    createdAt: '',
    lastUpdate: '',
    rating: 0,
  );
}
