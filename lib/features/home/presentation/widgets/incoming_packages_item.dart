import 'package:cached_network_image/cached_network_image.dart';
import 'package:drb_shipment_user/features/packages/data/models/packages_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../../core/utils/navigator_helper.dart';
import '../../../packages/presentation/screens/packages_details_screen.dart';

class IncomingPackagesItem extends StatelessWidget {
  const IncomingPackagesItem({super.key, required this.packagesModel});
  final PackageModel packagesModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(
          transitionBuilder: AppNavigator.cupertinoTransition,
          screen: PackagesDetailsScreen(packageData: packagesModel),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingHelper.horizontal4,
          vertical: SpacingHelper.kVertical4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
          color: ColorHelper.grey100.withValues(alpha: 0.05),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(RadiusHelper.kRadius6),
              child: CachedNetworkImage(
                imageUrl:
                    "https://i.pinimg.com/736x/d3/e7/0d/d3e70d89e5bfbe3b18c4ccdb6901d7df.jpg",
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
            Gap(SpacingHelper.horizontal8),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.orderNumber,
                  style: AppTextTheme.text14W500grey400,
                ),
                Gap(SpacingHelper.kVertical4),
                Text(packagesModel.id ??'', style: AppTextTheme.text16W500grey300),
              ],
            ),
            Spacer(),
            Text('On the way', style: AppTextTheme.nonlineText14Primary),
            Gap(SpacingHelper.horizontal8),
          ],
        ),
      ),
    );
  }
}
