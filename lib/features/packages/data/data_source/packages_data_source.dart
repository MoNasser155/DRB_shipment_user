import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/constants.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../companies/data/models/company_model.dart';
import '../../../couriers/data/models/courier_model.dart';
import '../models/packages_model.dart';

abstract class PackagesDataSource {
  Future<List<PackageModel>> getPackages(String uId, {String? status});
  Future<UserEntity> getSenderById(String senderId);
  Future<CourierModel> getCourierById(String courierId);
  Future<CompanyModel> getCompanyById(String companyId);
}

class PackagesDataSourceImpl implements PackagesDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<PackageModel>> getPackages(String uId, {String? status}) async {
    final packagesList =
        await _firestore
            .collection(Collections.packages)
            .where('user_id', isEqualTo: uId)
            .where('status', isEqualTo: status)
            .get();
    return packagesList.docs.map((doc) {
      final data = doc.data();
      data['package_id'] = doc.id;
      return PackageModel.fromFirestore(data);
    }).toList();
  }

  @override
  Future<UserEntity> getSenderById(String senderId) async {
    final user =
        await _firestore.collection(Collections.users).doc(senderId).get();
    return UserEntity.fromMap(user.data()!);
  }

  @override
  Future<CourierModel> getCourierById(String courierId) async {
    final courier =
        await _firestore.collection(Collections.couriers).doc(courierId).get();

    return CourierModel.fromFireStore({...courier.data()!, 'id': courier.id});
  }

  @override
  Future<CompanyModel> getCompanyById(String companyId) async {
    final company =
        await _firestore.collection(Collections.companies).doc(companyId).get();
    return CompanyModel.fromJson({...company.data()!, 'id': company.id});
  }
}
