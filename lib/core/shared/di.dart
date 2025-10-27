import 'package:drb_shipment_user/core/constants.dart';
import '../../features/main_view/presentation/cubits/cubit/main_view_cubit.dart';
import '../../features/packages/di.dart';

setupAppDebendencies() {
  initSharedDebendencies();
  initPackagesDebendencies();
}

void initSharedDebendencies() {
  sl.registerFactory<MainViewCubit>(() => MainViewCubit());
}
