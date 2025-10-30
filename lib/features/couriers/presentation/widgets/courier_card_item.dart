import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../../core/utils/navigator_helper.dart';
import '../../../../core/widgets/custom_cached_image.dart';
import '../../data/models/courier_model.dart';
import '../screens/courier_details_screen.dart';

class CourierCardItem extends StatelessWidget {
  const CourierCardItem({super.key, required this.couriersModel});
  final CourierModel couriersModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(
          transitionBuilder: AppNavigator.cupertinoTransition,
          screen: CourierDetailsScreen(couriersModel: couriersModel),
        );
      },
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 84.h,
          minHeight: 84.h,
          maxWidth: 56.w,
          minWidth: 56.w,
        ),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: ColorHelper.grey100.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: CustomCachedImage(
                imageUrl: couriersModel.image,
                width: double.infinity,
                height: 84.h,
              ),
            ),
            Gap(SpacingHelper.horizontal8),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${couriersModel.name} - ${couriersModel.licenceNum}',
                    style: AppTextTheme.text18W600grey100,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(SpacingHelper.kVertical4),
                  Text(
                    '${LocaleKeys.phone}: ${couriersModel.phone}',
                    style: AppTextTheme.text14W500grey300,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(SpacingHelper.kVertical4),
                  Text(
                    '${LocaleKeys.email}: ${couriersModel.email}',
                    style: AppTextTheme.text14W500grey300,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(SpacingHelper.kVertical4),
                  Text(
                    '${LocaleKeys.vehicleInfo}: ${couriersModel.vehicleType.title} - ${couriersModel.vehicleNum}',
                    style: AppTextTheme.text14W500grey300,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: SpacingHelper.horizontal8,
                      vertical: SpacingHelper.kVertical4,
                    ),
                    decoration: BoxDecoration(
                      color: couriersModel.status.color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(
                        RadiusHelper.kRadius6,
                      ),
                    ),
                    child: Text(
                      couriersModel.status.title,
                      style: AppTextTheme.text14W500grey300.copyWith(
                        color: couriersModel.status.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
