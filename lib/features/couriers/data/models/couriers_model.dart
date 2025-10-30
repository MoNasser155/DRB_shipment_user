import 'package:drb_shipment_user/core/enums/vehicle_type.dart';
import '../../../../core/enums/courier_status.dart';

class CourierModel {
  final String id;
  final String companyId;
  final String email;
  final String image;
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
    required this.image,
    required this.rating,
    required this.email,
    required this.companyId,
    required this.status,
    required this.vehicleType,
    required this.vehicleNum,
    required this.licenceNum,
  });

  factory CourierModel.fromMap(Map<String, dynamic> map) => CourierModel(
    id: map['id'],
    companyId: map['companyId'],
    email: map['courierEmail'],
    image: map['courierImage'],
    name: map['courierName'],
    phone: map['courierPhoneNum'],
    rating: map['rating'],
    status: CourierStatus.fromString(map['status']),
    vehicleType: VehicleType.fromFirebaseValue(map['vehicleType']),
    vehicleNum: map['vehicleNum'],
    licenceNum: map['licenceNum'],
  );

  factory CourierModel.skeleton() => CourierModel(
    id: '',
    companyId: '',
    email: '',
    image: '',
    name: '',
    phone: '',
    rating: 0.0,
    status: CourierStatus.available,
    vehicleType: VehicleType.truck,
    vehicleNum: '',
    licenceNum: '',
  );
}
