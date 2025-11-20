import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/constants.dart';
import '../models/courier_model.dart';

abstract class CouriersDataSource {
  Future<List<CourierModel>> getLimitedCouriers(String companyId);
  Future<List<CourierModel>> getAllCouriers(String companyId);
}

class CouriersDataSourceImpl implements CouriersDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<CourierModel>> getAllCouriers(String companyId) async {
    final allCouriers =
        await _firestore
            .collection(Collections.couriers)
            .where('company_id', isEqualTo: companyId)
            .get();
    log(allCouriers.docs.length.toString());
    return allCouriers.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return CourierModel.fromFireStore(data);
    }).toList();
  }

  @override
  Future<List<CourierModel>> getLimitedCouriers(String companyId) async {
    final allCouriers =
        await _firestore
            .collection(Collections.couriers)
            .where('company_id', isEqualTo: companyId)
            .limit(3)
            .get();
    return allCouriers.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return CourierModel.fromFireStore(data);
    }).toList();
  }
}
