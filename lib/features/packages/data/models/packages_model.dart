import 'package:drb_shipment_user/core/enums/payment.dart';

class PackagesModel {
  final String id;
  final String senderId;
  final String receiverName;
  final String recieverPhone;
  final String receiverEmail;
  final String packageContent;
  final Payment paymentMethod;
  final num price;
  final String status;
  final String pickupLocation;
  final String dropoffLocation;
  final bool isFragile;
  final num weight;

  PackagesModel({
    required this.id,
    required this.senderId,
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

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
    id: json['id'],
    senderId: json['senderId'],
    receiverName: json['recieverName'],
    recieverPhone: json['recieverPhone'],
    receiverEmail: json['recieverEmail'],
    packageContent: json['content'],
    price: json['price'],
    paymentMethod: Payment.fromFirebaseValue(json['paymentMethod']),
    status: json['status'],
    pickupLocation: json['pickupLocation'],
    dropoffLocation: json['dropoffLocation'],
    isFragile: json['isFragile'],
    weight: json['weight'],
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['senderId'] = senderId;
    data['recieverName'] = receiverName;
    data['recieverPhone'] = recieverPhone;
    data['recieverEmail'] = receiverEmail;
    data['content'] = packageContent;
    data['price'] = price;
    data['paymentMethod'] = paymentMethod;
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
    receiverName: '',
    recieverPhone: '',
    receiverEmail: '',
    packageContent: '',
    price: 0,
    paymentMethod: Payment.cash,
    status: '',
    pickupLocation: '',
    dropoffLocation: '',
    isFragile: false,
    weight: 0,
  );
}
