import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drb_shipment_user/core/enums/packages_status.dart';
import 'package:drb_shipment_user/features/home/data/models/ads_banner_model.dart';
import '../../../couriers/data/models/couriers_company_model.dart';
import '../../../packages/data/models/packages_model.dart';

abstract class HomeDataSource {
  Future<List<AdsBannerModel>> getAds();
  Future<List<PackagesModel>> getHomePackages(String uId);
  Future<List<CouriersCompanyModel>> getHomeCouriersCompanies();
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<AdsBannerModel>> getAds() async {
    final adsList =
        await _firestore
            .collection('ads')
            .where('toDate', isGreaterThanOrEqualTo: DateTime.now())
            .get();
    return adsList.docs.map((e) => AdsBannerModel.fromMap(e.data())).toList();
  }

  @override
  Future<List<PackagesModel>> getHomePackages(String uId) async {
    final packagesList =
        await _firestore
            .collection('packages')
            .where('senderId', isEqualTo: uId)
            .where('status', isEqualTo: PackagesStatus.inProgress.firebaseValue)
            .limit(3)
            .get();
    return packagesList.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return PackagesModel.fromJson(data);
    }).toList();
  }

  @override
  Future<List<CouriersCompanyModel>> getHomeCouriersCompanies() async {
    final couriersList =
        await _firestore.collection('couriersCompany').limit(5).get();
    return couriersList.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return CouriersCompanyModel.fromJson(data);
    }).toList();
  }
}
