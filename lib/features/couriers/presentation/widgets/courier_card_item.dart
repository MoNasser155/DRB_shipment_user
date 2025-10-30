import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../../core/widgets/custom_cached_image.dart';
import '../../data/models/couriers_model.dart';

class CourierCardItem extends StatelessWidget {
  const CourierCardItem({super.key, required this.couriersModel});
  final CouriersModel couriersModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 84.h),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: ColorHelper.grey100.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: CustomCachedImage(imageUrl: couriersModel.image)),
          Gap(SpacingHelper.horizontal8),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${couriersModel.name} - ${couriersModel.licenceNum}',
                  style: AppTextTheme.text18W600grey100,
                ),
                Gap(SpacingHelper.kVertical4),
                Text(
                  '${LocaleKeys.phone}: ${couriersModel.phone}',
                  style: AppTextTheme.text14W500grey300,
                ),
                Gap(SpacingHelper.kVertical4),
                Text(
                  '${LocaleKeys.email}: ${couriersModel.email}',
                  style: AppTextTheme.text14W500grey300,
                ),
                Gap(SpacingHelper.kVertical4),
                Text(
                  '${LocaleKeys.vehicleInfo}: ${couriersModel.vehicleType.title} - ${couriersModel.vehicleNum}',
                  style: AppTextTheme.text14W500grey300,
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SpacingHelper.horizontal8,
                  vertical: SpacingHelper.kVertical4,
                ),
                decoration: BoxDecoration(
                  color: couriersModel.status.color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(RadiusHelper.kRadius6),
                ),
                child: Text(
                  couriersModel.status.title,
                  style: AppTextTheme.text16W500grey100.copyWith(
                    color: couriersModel.status.color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
