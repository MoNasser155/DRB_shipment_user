import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../data/models/courier_model.dart';
import 'custom_courier_details_row.dart';

class CourierInfoCard extends StatelessWidget {
  const CourierInfoCard({super.key, required this.couriersModel});
  final CourierModel couriersModel;
  @override
  Widget build(BuildContext context) {
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
            spacing: SpacingHelper.kVertical4,
            children: [
              CustomCourierDetailsRow(
                title: '${LocaleKeys.name}:',
                subTitle: couriersModel.name,
                children: [
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SpacingHelper.horizontal8,
                      vertical: SpacingHelper.kVertical4,
                    ),
                    decoration: BoxDecoration(
                      color: ColorHelper.yellow.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(
                        RadiusHelper.kRadius6,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: ColorHelper.yellow, size: 18),
                        Gap(SpacingHelper.horizontal4),
                        Text(
                          couriersModel.rating.toString(),
                          style: AppTextTheme.text16W500grey100.copyWith(
                            color: ColorHelper.yellow,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomCourierDetailsRow(
                title: '${LocaleKeys.phone}:',
                subTitle: couriersModel.phone,
              ),
              CustomCourierDetailsRow(
                title: '${LocaleKeys.email}:',
                subTitle: couriersModel.email,
              ),
              CustomCourierDetailsRow(
                title: '${LocaleKeys.driverLicense}:',
                subTitle: couriersModel.licenceNum,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
