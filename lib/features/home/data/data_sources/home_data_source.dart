import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drb_shipment_user/core/enums/packages_status.dart';
import 'package:drb_shipment_user/features/home/data/models/ads_banner_model.dart';
import '../../../packages/data/models/packages_model.dart';

abstract class HomeDataSource {
  Future<List<AdsBannerModel>> getAds();
  Future<List<PackagesModel>> getHomePackages(String uId);
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<AdsBannerModel>> getAds() async {
    final adsList = await _firestore.collection('ads').get();
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
}
