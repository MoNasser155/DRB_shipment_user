import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/features/packages/presentation/cubits/cubit/packages_cubit.dart';

initPackagesDebendencies() {
  sl.registerFactory<PackagesCubit>(() => PackagesCubit());
}
