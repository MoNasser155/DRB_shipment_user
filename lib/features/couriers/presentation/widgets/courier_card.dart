import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:drb_shipment_user/core/utils/navigator_helper.dart';
import 'package:drb_shipment_user/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../screens/courier_details_screen.dart';

class CourierCard extends StatelessWidget {
  const CourierCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(
          transitionBuilder: AppNavigator.cupertinoTransition,
          screen: CourierDetailsScreen(),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: ColorHelper.grey100.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCachedImage(
              width: 56,
              height: 56,
              radius: RadiusHelper.kRadius6,
            ),
            Gap(SpacingHelper.horizontal8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Courier Name",
                        style: AppTextTheme.text16W500grey100,
                      ),
                      Spacer(),
                      Text(
                        "4.8",
                        style: AppTextTheme.text12W500grey500.copyWith(
                          color: ColorHelper.grey100,
                        ),
                      ),
                      Gap(SpacingHelper.horizontal4),
                      Icon(
                        Icons.star,
                        color: ColorHelper.primaryGreen,
                        size: 16,
                      ),
                    ],
                  ),
                  Gap(SpacingHelper.kVertical4),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_android,
                        color: ColorHelper.primaryGreen,
                        size: 16,
                      ),
                      Text(
                        "+201091234567",
                        style: AppTextTheme.text14W500grey300.copyWith(
                          color: ColorHelper.grey400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(SpacingHelper.horizontal4),
          ],
        ),
      ),
    );
  }
}
