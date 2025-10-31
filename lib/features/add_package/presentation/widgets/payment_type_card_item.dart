import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/enums/payment.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../cubits/cubit/add_package_cubit.dart';
import 'custom_radio_button.dart';

class PaymentTypeCardItem extends StatelessWidget {
  const PaymentTypeCardItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPackageCubit, AddPackageState>(
      buildWhen:
          (previous, current) =>
              previous.selectedPaymentMethod != current.selectedPaymentMethod,
      builder: (context, state) {
        final cubit = AddPackageCubit.get(context);
        return InkWell(
          onTap: () {
            cubit.setPaymentMethod(Payment.values[index]);
            log(Payment.values[index].firebaseValue);
          },
          borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: SpacingHelper.horizontal12,
              vertical: SpacingHelper.kVertical8,
            ),
            decoration: BoxDecoration(
              color: ColorHelper.grey100.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
            ),
            child: CustomRadioButton<Payment>(
              value: Payment.values[index],
              label: Payment.values[index].title,
              groupValue: state.selectedPaymentMethod,
            ),
          ),
        );
      },
    );
  }
}
