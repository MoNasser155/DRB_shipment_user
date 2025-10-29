import 'package:drb_shipment_user/features/packages/data/models/packages_model.dart';

abstract class PackagesDataSource {
  Future<List<PackagesModel>> getPackages(String uId);
  Future<void> addPackage(PackagesModel packagesModel);
}
