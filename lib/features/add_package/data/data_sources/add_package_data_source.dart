import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exceptions.dart';
import '../../../packages/data/models/packages_model.dart';

abstract class AddPackageDataSource {
  Future<void> addPackage(PackageModel packagesModel);
}

class AddPackageDataSourceImpl implements AddPackageDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addPackage(PackageModel packagesModel) async {
    try {
      await _firestore.collection('packages').add(packagesModel.toJson());
    } on Exception catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
