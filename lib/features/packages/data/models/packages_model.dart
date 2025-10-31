import 'package:drb_shipment_user/core/enums/payment.dart';
import 'package:drb_shipment_user/core/shared/models/coordinates.dart';

class PackageModel {
  final String? id;
  final String senderId;
  final String? courierId;
  final String? companyId;
  final String receiverName;
  final String recieverPhone;
  final String receiverEmail;
  final String packageContent;
  final Payment paymentMethod;
  final num price;
  final String status;
  final Coordinates pickupLocation;
  final Coordinates dropoffLocation;
  final bool isFragile;
  final num weight;

  PackageModel({
    this.id,
    required this.senderId,
    this.courierId,
    this.companyId,
    required this.receiverName,
    required this.recieverPhone,
    required this.receiverEmail,
    required this.packageContent,
    required this.price,
    required this.paymentMethod,
    required this.status,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.isFragile,
    required this.weight,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
    id: json['id'],
    senderId: json['senderId'],
    courierId: json['courierId'] ?? '',
    companyId: json['companyId'] ?? '',
    receiverName: json['recieverName'],
    recieverPhone: json['recieverPhone'],
    receiverEmail: json['recieverEmail'],
    packageContent: json['content'],
    price: json['price'],
    paymentMethod: Payment.fromFirebaseValue(json['paymentMethod']),
    status: json['status'],
    pickupLocation: stringToLocation(json['pickupLocation']),
    dropoffLocation: stringToLocation(json['dropoffLocation']),
    isFragile: json['isFragile'],
    weight: json['weight'],
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['senderId'] = senderId;
    data['courierId'] = courierId;
    data['companyId'] = companyId;
    data['content'] = packageContent;
    data['price'] = 0.0;
    data['paymentMethod'] = paymentMethod.firebaseValue;
    data['status'] = status;
    data['pickupLocation'] = locationToString(pickupLocation);
    data['dropoffLocation'] = locationToString(dropoffLocation);
    data['recieverName'] = receiverName;
    data['recieverPhone'] = recieverPhone;
    data['recieverEmail'] = receiverEmail;
    data['isFragile'] = isFragile;
    data['weight'] = weight;
    return data;
  }

  factory PackageModel.skeleton() => PackageModel(
    id: '',
    senderId: '',
    courierId: '',
    companyId: '',
    receiverName: '',
    recieverPhone: '',
    receiverEmail: '',
    packageContent: '',
    price: 0,
    paymentMethod: Payment.cash,
    status: '',
    pickupLocation: Coordinates(0, 0),
    dropoffLocation: Coordinates(0, 0),
    isFragile: false,
    weight: 0,
  );
}
