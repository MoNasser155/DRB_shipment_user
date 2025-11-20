import 'package:drb_shipment_user/core/enums/payment.dart';
import 'package:drb_shipment_user/core/shared/models/coordinates.dart';
import '../../../../core/enums/delivery_type.dart';
import '../../../../core/enums/packages_status.dart';

class PackageModel {
  final String? id;
  final String senderId;
  final String courierId;
  final String companyId;
  final String? reviewId;
  final String createdAt;
  final String? deliveredAt;
  final bool isAccepted;
  final num? price;
  final DeliveryType deliveryType;
  final PackagesStatus status;
  final LocationInfo pickupLocation;
  final LocationInfo dropoffLocation;
  final ReveiverInfo receiverInfo;
  final PackageDetails packageDetails;
  final PaymentDetails paymentDetails;

  PackageModel({
    this.id,
    required this.senderId,
    required this.courierId,
    required this.companyId,
    this.reviewId,
    required this.createdAt,
    this.deliveredAt,
    required this.isAccepted,
    this.price,
    required this.deliveryType,
    required this.status,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.receiverInfo,
    required this.packageDetails,
    required this.paymentDetails,
  });

  Map<String, dynamic> toFirestore() => <String, dynamic>{
    'user_id': senderId,
    'courier_id': courierId,
    'company_id': companyId,
    'review_id': reviewId,
    'created_at': createdAt,
    'delivered_at': deliveredAt,
    'is_accepted': isAccepted,
    'price': 0.0,
    'delivery_type': deliveryType.firebaseValue,
    'status': status.firebaseValue,
    'pickup_location': pickupLocation.toFirestore(),
    'drop_off_location': dropoffLocation.toFirestore(),
    'recipient_info': receiverInfo.toFirestore(),
    'package_details': packageDetails.toFirestore(),
    'payment': paymentDetails.toFirestore(),
  };

  factory PackageModel.fromFirestore(Map<String, dynamic> json) => PackageModel(
    id: json['package_id'],
    senderId: json['user_id'],
    courierId: json['courier_id'] ?? '',
    companyId: json['company_id'] ?? '',
    reviewId: json['review_id'] ?? '',
    createdAt: json['created_at'],
    deliveredAt: json['delivered_at'] ?? '',
    isAccepted: json['is_accepted'],
    price: json['price'],
    deliveryType: DeliveryType.fromFirebaseValue(json['delivery_type']),
    status: PackagesStatus.fromFirebaseValue(json['status']),
    pickupLocation: LocationInfo.fromFirestore(json['pickup_location']),
    dropoffLocation: LocationInfo.fromFirestore(json['drop_off_location']),
    receiverInfo: ReveiverInfo.fromFirestore(json['recipient_info']),
    packageDetails: PackageDetails.fromFirestore(json['package_details']),
    paymentDetails: PaymentDetails.fromFirestore(json['payment']),
  );

  factory PackageModel.skeleton() => PackageModel(
    id: '',
    senderId: '',
    courierId: '',
    companyId: '',
    reviewId: '',
    createdAt: '',
    deliveredAt: '',
    isAccepted: false,
    price: 0.0,
    deliveryType: DeliveryType.regular,
    status: PackagesStatus.inProgress,
    pickupLocation: LocationInfo.skeleton(),
    dropoffLocation: LocationInfo.skeleton(),
    receiverInfo: ReveiverInfo.skeleton(),
    packageDetails: PackageDetails.skeleton(),
    paymentDetails: PaymentDetails.skeleton(),
  );
}

class LocationInfo {
  final Coordinates location;
  final String address;
  final String government;
  final String city;

  LocationInfo({
    required this.location,
    required this.address,
    required this.government,
    required this.city,
  });

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> map = <String, dynamic>{
      'location': locationToString(location),
      'address': address,
      'government': government,
      'city': city,
    };
    return map;
  }

  factory LocationInfo.fromFirestore(Map<String, dynamic> json) => LocationInfo(
    location: stringToLocation(json['location']),
    address: json['address'],
    government: json['government'],
    city: json['city'],
  );

  factory LocationInfo.skeleton() => LocationInfo(
    location: Coordinates(0, 0),
    address: '',
    government: '',
    city: '',
  );
}

class PackageDetails {
  final String content;
  final String? notes;
  final num weight;
  final bool isFragile;

  PackageDetails({
    required this.content,
    this.notes,
    required this.weight,
    required this.isFragile,
  });

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> map = <String, dynamic>{
      'package_content': content,
      'notes': notes,
      'weight': weight,
      'is_fragile': isFragile,
    };
    return map;
  }

  factory PackageDetails.fromFirestore(Map<String, dynamic> json) =>
      PackageDetails(
        content: json['package_content'],
        notes: json['notes'],
        weight: json['weight'],
        isFragile: json['is_fragile'],
      );

  factory PackageDetails.skeleton() =>
      PackageDetails(content: '', notes: '', weight: 0, isFragile: false);
}

class ReveiverInfo {
  final String name;
  final String phone;
  final String email;

  ReveiverInfo({required this.name, required this.phone, required this.email});

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> map = <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
    };
    return map;
  }

  factory ReveiverInfo.fromFirestore(Map<String, dynamic> json) => ReveiverInfo(
    name: json['name'],
    phone: json['phone'],
    email: json['email'],
  );

  factory ReveiverInfo.skeleton() =>
      ReveiverInfo(name: '', phone: '', email: '');
}

class PaymentDetails {
  final String id;
  final Payment paymentMethod;
  final String status;

  PaymentDetails({
    required this.id,
    required this.paymentMethod,
    required this.status,
  });

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> map = <String, dynamic>{
      'payment_id': '123',
      'payment_method': Payment.cash.firebaseValue,
      'payment_status': PaymentStatus.pending.firebaseValue,
    };
    return map;
  }

  factory PaymentDetails.fromFirestore(Map<String, dynamic> json) =>
      PaymentDetails(
        id: json['payment_id'],
        paymentMethod: Payment.fromFirebaseValue(json['payment_method']),
        status: json['payment_status'],
      );

  factory PaymentDetails.skeleton() =>
      PaymentDetails(id: '', paymentMethod: Payment.cash, status: '');
}
