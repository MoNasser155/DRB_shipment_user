import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drb_shipment_user/core/enums/packages_status.dart';
import 'package:drb_shipment_user/features/home/data/models/ads_banner_model.dart';
import '../../../../core/constants.dart';
import '../../../companies/data/models/company_model.dart';
import '../../../packages/data/models/packages_model.dart';

abstract class HomeDataSource {
  Future<List<AdsBannerModel>> getAds();
  Future<List<PackageModel>> getHomePackages(String uId);
  Future<List<CompanyModel>> getHomeCouriersCompanies();
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<AdsBannerModel>> getAds() async {
    final adsList =
        await _firestore
            .collection(Collections.ads)
            .where('toDate', isGreaterThanOrEqualTo: DateTime.now())
            .get();
    return adsList.docs.map((e) => AdsBannerModel.fromMap(e.data())).toList();
  }

  @override
  Future<List<PackageModel>> getHomePackages(String uId) async {
    final packagesList =
        await _firestore
            .collection(Collections.packages)
            .where('user_id', isEqualTo: uId)
            .where('status', isEqualTo: PackagesStatus.inProgress.firebaseValue)
            .limit(3)
            .get();
    return packagesList.docs.map((doc) {
      final data = doc.data();
      data['package_id'] = doc.id;
      return PackageModel.fromFirestore(data);
    }).toList();
  }

  @override
  Future<List<CompanyModel>> getHomeCouriersCompanies() async {
    final couriersList =
        await _firestore.collection(Collections.companies).limit(5).get();
    return couriersList.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return CompanyModel.fromJson(data);
    }).toList();
  }
}
