class PackagesModel {
  final String id;
  final String senderId;
  final String packageContent;
  final num price;
  final String status;
  final String pickupLocation;
  final String dropoffLocation;
  final bool isFragile;
  final num weight;

  PackagesModel({
    required this.id,
    required this.senderId,
    required this.packageContent,
    required this.price,
    required this.status,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.isFragile,
    required this.weight,
  });

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
    id: json['id'] as String? ?? '',
    senderId: json['senderId'] as String? ?? '',
    packageContent: json['packageContent'] as String? ?? '',
    price: json['price'] as num? ?? 0,
    status: json['status'] as String? ?? '',
    pickupLocation: json['pickupLocation'] as String? ?? '',
    dropoffLocation: json['dropoffLocation'] as String? ?? '',
    isFragile: json['isFragile'] as bool? ?? false,
    weight: json['weight'] as num? ?? 0,
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['senderId'] = senderId;
    data['packageContent'] = packageContent;
    data['price'] = price;
    data['status'] = status;
    data['pickupLocation'] = pickupLocation;
    data['dropoffLocation'] = dropoffLocation;
    data['isFragile'] = isFragile;
    data['weight'] = weight;
    return data;
  }

  factory PackagesModel.skeleton() => PackagesModel(
    id: '',
    senderId: '',
    packageContent: '',
    price: 0,
    status: '',
    pickupLocation: '',
    dropoffLocation: '',
    isFragile: false,
    weight: 0,
  );
}
