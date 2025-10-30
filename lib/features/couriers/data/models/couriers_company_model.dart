class CouriersCompanyModel {
  final String id;
  final String name;
  final String imageUrl;
  final num rating;
  final String location;

  CouriersCompanyModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.location ,
  });

  factory CouriersCompanyModel.fromJson(Map<String, dynamic> json) =>
      CouriersCompanyModel(
        id: json['id'],
        name: json['companyName'],
        imageUrl: json['companyImage'],
        rating: json['companyRate'],
        location: json['location'],
      );

  factory CouriersCompanyModel.skeleton() =>
      CouriersCompanyModel(id: '', name: '', imageUrl: '', rating: 0, location: '');
}
