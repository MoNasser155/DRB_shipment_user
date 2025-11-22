import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../data/models/courier_model.dart';
import 'custom_courier_details_row.dart';

class VehicleInfoCard extends StatelessWidget {
  const VehicleInfoCard({super.key, required this.couriersModel});
  final CourierModel couriersModel;
  @override
  Widget build(BuildContext context) {
    log(couriersModel.vehicleType.toString());
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingHelper.kHorizontalPadding,
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorHelper.grey100.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
          ),
          child: Column(
            children: [
              CustomCourierDetailsRow(
                title: '${LocaleKeys.vehicleType}:',
                subTitle: couriersModel.vehicleType.title,
              ),
              CustomCourierDetailsRow(
                title: '${LocaleKeys.plateNumber}:',
                subTitle: couriersModel.vehicleNum,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
