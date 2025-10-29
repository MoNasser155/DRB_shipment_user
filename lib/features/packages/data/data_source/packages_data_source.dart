import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../models/packages_model.dart';

abstract class PackagesDataSource {
  Future<List<PackagesModel>> getPackages(String uId, {String? status});
  Future<UserEntity> getSenderById(String uId);
  Future<void> addPackage(PackagesModel packagesModel);
}

class PackagesDataSourceImpl implements PackagesDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<PackagesModel>> getPackages(String uId, {String? status}) async {
    @override
    final packagesList =
        await _firestore
            .collection('packages')
            .where('senderId', isEqualTo: uId)
            .where('status', isEqualTo: status)
            .get();
    return packagesList.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return PackagesModel.fromJson(data);
    }).toList();
  }

  @override
  Future<UserEntity> getSenderById(String uId) async {
    final user = await _firestore.collection('users').doc(uId).get();
    return UserEntity.fromMap(user.data()!);
  }

  @override
  Future<void> addPackage(PackagesModel packagesModel) async {
    throw UnimplementedError();
  }
}
