class CompanyModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String email;
  final String phone;
  final num rating;
  final String location;

  CompanyModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.email,
    required this.phone,
    required this.rating,
    required this.location,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    id: json['id'],
    name: json['companyName'],
    description: json['description'],
    imageUrl: json['companyImage'],
    email: json['companyEmail'],
    phone: json['companyPhone'],
    rating: json['companyRate'],
    location: json['location'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'companyName': name,
    'companyEmail': email,
    'companyPhone': phone,
    'description': description,
    'companyImage': imageUrl,
    'companyRate': rating,
    'location': location,
  };
  

  factory CompanyModel.skeleton() => CompanyModel(
    id: '',
    name: '',
    description: '',
    email: '',
    phone: '',
    imageUrl: '',
    rating: 0,
    location: '',
  );
}
