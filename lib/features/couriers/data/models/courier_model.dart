import 'package:drb_shipment_user/core/enums/vehicle_type.dart';
import '../../../../core/enums/courier_status.dart';

class CourierModel {
  final String id;
  final String companyId;
  final String email;
  final String imageUrl;
  final String name;
  final String phone;
  final num rating;
  final CourierStatus status;
  final VehicleType vehicleType;
  final String vehicleNum;
  final String licenceNum;

  CourierModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.imageUrl,
    required this.rating,
    required this.email,
    required this.companyId,
    required this.status,
    required this.vehicleType,
    required this.vehicleNum,
    required this.licenceNum,
  });

  factory CourierModel.fromFireStore(Map<String, dynamic> map) => CourierModel(
    id: map['id'],
    companyId: map['company_id'],
    email: map['email'],
    imageUrl: map['imageUrl'],
    name: map['username'],
    phone: map['phone'],
    rating: map['rating'],
    status: CourierStatus.fromString(map['status']),
    vehicleType: VehicleType.fromFirebaseValue(map['vehicleType']),
    vehicleNum: map['vehicleNumber'],
    licenceNum: map['licenseNumber'],
  );

  factory CourierModel.skeleton() => CourierModel(
    id: '',
    companyId: '',
    email: '',
    imageUrl: '',
    name: '',
    phone: '',
    rating: 0.0,
    status: CourierStatus.available,
    vehicleType: VehicleType.truck,
    vehicleNum: '',
    licenceNum: '',
  );

  @override
  toString() =>
      'CourierModel(id: $id, name: $name, phone: $phone, image: $imageUrl, rating: $rating, status: $status, vehicleType: $vehicleType, vehicleNum: $vehicleNum, licenceNum: $licenceNum)';
}
