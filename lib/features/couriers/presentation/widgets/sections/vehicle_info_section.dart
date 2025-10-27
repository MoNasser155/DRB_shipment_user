
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/color_helper.dart';
import '../../../../../core/enums/vehicle_type.dart';
import '../../../../../core/helpers/redius_helper.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';

class VehicleInfoSection extends StatelessWidget {
  const VehicleInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingHelper.kHorizontalPadding,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorHelper.grey100.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.directions_car,
                    color: ColorHelper.primaryGreen,
                    size: 20,
                  ),
                  Gap(SpacingHelper.horizontal4),
                  Text(
                    LocaleKeys.vehicleInfo,
                    style: AppTextTheme.text18W600grey100,
                  ),
                ],
              ),
              Gap(SpacingHelper.kVertical4),
              Row(
                children: [
                  Text(
                    '${LocaleKeys.plateNumber}:',
                    style: AppTextTheme.text14W500grey300,
                  ),
                  Gap(SpacingHelper.horizontal4),
                  Text('1234', style: AppTextTheme.text14W500grey300),
                ],
              ),
              Gap(SpacingHelper.kVertical4),
    
              Row(
                children: [
                  Text(
                    '${LocaleKeys.type}:',
                    style: AppTextTheme.text14W500grey300,
                  ),
                  Gap(SpacingHelper.horizontal4),
                  Text(
                    VehicleType.truck.title,
                    style: AppTextTheme.text14W500grey300,
                  ),
                ],
              ),
              Gap(SpacingHelper.kVertical4),
    
              Row(
                children: [
                  Text(
                    '${LocaleKeys.model}:',
                    style: AppTextTheme.text14W500grey300,
                  ),
                  Gap(SpacingHelper.horizontal4),
                  Text('2013', style: AppTextTheme.text14W500grey300),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
