import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/constants.dart';
import '../../../packages/data/models/packages_model.dart';

abstract class AddPackageDataSource {
  Future<void> addPackage(PackageModel packagesModel);
}

class AddPackageDataSourceImpl implements AddPackageDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addPackage(PackageModel packagesModel) async {
    await _firestore.collection(Collections.packages).add(packagesModel.toJson());
  }
}
