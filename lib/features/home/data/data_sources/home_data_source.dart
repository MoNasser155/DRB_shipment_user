import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drb_shipment_user/features/home/data/models/ads_banner_model.dart';

abstract class HomeDataSource {
  Future<List<AdsBannerModel>> getAds();
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<AdsBannerModel>> getAds() async {
    final adsList = await _firestore.collection('ads').get();
    return adsList.docs.map((e) => AdsBannerModel.fromMap(e.data())).toList();
  }
}
