import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/features/main_view/presentation/cubits/cubit/main_view_cubit.dart';

setupAppDebendencies() {
  initSharedDebendencies();
}

void initSharedDebendencies() {
  sl.registerFactory<MainViewCubit>(() => MainViewCubit());
}
