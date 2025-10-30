import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drb_shipment_user/core/error/exceptions.dart';
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
    try {
      final packagesList =
          await _firestore
              .collection('packages')
              .where('senderId', isEqualTo: uId)
              .where('status', isEqualTo: status)
              .get();
      return packagesList.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return PackageModel.fromJson(data);
      }).toList();
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<UserEntity> getSenderById(String senderId) async {
    try {
      final user = await _firestore.collection('users').doc(senderId).get();
      return UserEntity.fromMap(user.data()!);
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<CourierModel> getCourierById(String courierId) async {
    try {
      final courier =
          await _firestore.collection('couriers').doc(courierId).get();

      return CourierModel.fromMap({...courier.data()!, 'id': courier.id});
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<CompanyModel> getCompanyById(String companyId) async {
    try {
      final company =
          await _firestore.collection('couriersCompany').doc(companyId).get();
      return CompanyModel.fromJson({...company.data()!, 'id': company.id});
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
