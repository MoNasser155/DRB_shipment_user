import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exceptions.dart';
import '../models/courier_model.dart';

abstract class CouriersDataSource {
  Future<List<CourierModel>> getLimitedCouriers(String companyId);
  Future<List<CourierModel>> getAllCouriers(String companyId);
}

class CouriersDataSourceImpl implements CouriersDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<CourierModel>> getAllCouriers(String companyId) async {
    try {
      final allCouriers =
          await _firestore
              .collection('couriers')
              .where('companyId', isEqualTo: companyId)
              .get();
      log(allCouriers.docs.length.toString());
      return allCouriers.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return CourierModel.fromMap(data);
      }).toList();
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<List<CourierModel>> getLimitedCouriers(String companyId) async {
    try {
      final allCouriers =
          await _firestore
              .collection('couriers')
              .where('companyId', isEqualTo: companyId)
              .limit(3)
              .get();
      return allCouriers.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return CourierModel.fromMap(data);
      }).toList();
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
