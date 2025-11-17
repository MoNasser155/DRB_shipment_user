import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants.dart';
import '../models/company_model.dart';

abstract class CompaniesDataSource {
  Future<List<CompanyModel>> getCompanies();
}

class CompaniesDataSourceImpl implements CompaniesDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<CompanyModel>> getCompanies() async {
    final couriersList = await _firestore.collection(Collections.companies).get();
    return couriersList.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return CompanyModel.fromJson(data);
    }).toList();
  }
}
