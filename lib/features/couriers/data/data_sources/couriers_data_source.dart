import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/couriers_company_model.dart';

abstract class CouriersDataSource {
  Future<List<CouriersCompanyModel>> getCouriersCompanies();
}

class CouriersDataSourceImpl implements CouriersDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<CouriersCompanyModel>> getCouriersCompanies() async {
    final couriersList =
        await _firestore.collection('couriersCompany').get();
    return couriersList.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return CouriersCompanyModel.fromJson(data);
    }).toList();
  }
}
