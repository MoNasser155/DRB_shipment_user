import 'package:drb_shipment_user/core/constants.dart';
import '../../features/add_package/di.dart';
import '../../features/auth/di.dart';
import '../../features/couriers/di.dart';
import '../../features/home/di.dart';
import '../../features/main_view/presentation/cubits/cubit/main_view_cubit.dart';
import '../../features/packages/di.dart';

setupAppDebendencies() {
  initSharedDebendencies();
  initAuthDebendencies();
  initHomeDebendencies();
  initPackagesDebendencies();
  initAddPackageDebendencies();
  initCouriersDebendencies();
}

void initSharedDebendencies() {
  sl.registerFactory<MainViewCubit>(() => MainViewCubit());
}
