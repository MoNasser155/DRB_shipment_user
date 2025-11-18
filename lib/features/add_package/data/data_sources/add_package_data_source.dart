import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../../../../core/constants.dart';
import '../../../packages/data/models/packages_model.dart';
import '../models/governments_model.dart';

abstract class AddPackageDataSource {
  Future<void> addPackage(PackageModel packagesModel);
  Future<BaseGovernmentsModel> getGovernments();
}

class AddPackageDataSourceImpl implements AddPackageDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addPackage(PackageModel packagesModel) async {
    await _firestore.collection(Collections.packages).add(packagesModel.toJson());
  }

   @override
  Future<BaseGovernmentsModel> getGovernments() async {
    try {
      final String jsonString =
          await rootBundle.loadString(Constants.governmentData);
      final jsonData = json.decode(jsonString);
      return BaseGovernmentsModel.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to load locations data: $e');
    }
  }
}
