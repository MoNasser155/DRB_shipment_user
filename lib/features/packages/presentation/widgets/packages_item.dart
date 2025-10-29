import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:drb_shipment_user/core/utils/navigator_helper.dart';
import 'package:drb_shipment_user/features/packages/data/models/packages_model.dart';
import 'package:drb_shipment_user/features/packages/presentation/screens/packages_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';

class PackagesItem extends StatelessWidget {
  const PackagesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(
          transitionBuilder: AppNavigator.cupertinoTransition,
          screen: PackagesDetailsScreen(packageData: PackagesModel.skeleton()), //yellow need to be handeled 
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingHelper.horizontal8,
          vertical: SpacingHelper.kVertical4,
        ),
        decoration: BoxDecoration(
          color: ColorHelper.grey100.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(LocaleKeys.orderId, style: AppTextTheme.text14W500grey400),
                Gap(SpacingHelper.kVertical4),
                Text('123412', style: AppTextTheme.text16W500grey100),
              ],
            ),
            Container(
              width: 2,
              height: 28,
              margin: EdgeInsets.symmetric(
                horizontal: SpacingHelper.horizontal8,
              ),
              decoration: BoxDecoration(
                color: ColorHelper.grey500,
                borderRadius: BorderRadius.circular(RadiusHelper.kRadius12),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order content', style: AppTextTheme.text14W500grey400),
                Gap(SpacingHelper.kVertical4),
                Text(
                  'something here',
                  style: AppTextTheme.text16W500grey100,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
