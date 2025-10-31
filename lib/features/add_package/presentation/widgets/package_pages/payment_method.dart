import 'package:drb_shipment_user/core/enums/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../cubits/cubit/add_package_cubit.dart';
import '../custom_package_column.dart';
import '../payment_type_card_item.dart';
import '../visa_info_item.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPackageCubit, AddPackageState>(
      buildWhen:
          (previous, current) =>
              previous.selectedPaymentMethod != current.selectedPaymentMethod,
      builder: (context, state) {
        final cubit = AddPackageCubit.get(context);
        return Form(
          key: cubit.paymentInfoFormKey,
          child: CustomPackageColumn(
            children: [
              Center(
                child: Text(
                  LocaleKeys.paymentMethod,
                  style: AppTextTheme.text18W600grey100,
                ),
              ),
              ...List.generate(Payment.values.length, (index) {
                return PaymentTypeCardItem(index: index);
              }),
              VisaInfoItem(),
            ],
          ),
        );
      },
    );
  }
}
