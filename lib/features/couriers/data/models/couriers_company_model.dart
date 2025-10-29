class CouriersCompanyModel {
  final String id;
  final String name;
  final String imageUrl;
  final num rating; 

  CouriersCompanyModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
  });

  factory CouriersCompanyModel.fromJson(Map<String, dynamic> json) =>
      CouriersCompanyModel(
        id: json['id'],
        name: json['companyName'],
        imageUrl: json['companyImage'],
        rating: json['companyRate'],
      );

  factory CouriersCompanyModel.skeleton() =>
      CouriersCompanyModel(id: '', name: '', imageUrl: '', rating: 0);
}
