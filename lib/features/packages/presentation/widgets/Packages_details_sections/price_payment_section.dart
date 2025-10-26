import 'package:drb_shipment_user/core/enums/payment.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../package_details_row.dart';

class PackageDetailsPriceSection extends StatelessWidget {
  const PackageDetailsPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingHelper.kVertical8,
      children: [
        Text(
          '${LocaleKeys.price} & ${LocaleKeys.payment}',
          style: AppTextTheme.text18W600grey100,
        ),
        PackageDetailsRow(
          icon: Icons.attach_money,
          title: LocaleKeys.paymentMethod,
          data: Payment.cash.title,
        ),
        PackageDetailsRow(
          icon: Icons.attach_money_outlined,
          title: LocaleKeys.totalPrice,
          data: '200 EGP',
        ),
      ],
    );
  }
}
