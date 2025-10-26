import 'package:drb_shipment_user/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';


class PackageDetailsCourierSection extends StatelessWidget {
  const PackageDetailsCourierSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingHelper.kVertical8,
      children: [
        Text(LocaleKeys.courierInfo, style: AppTextTheme.text18W600grey100),

        Row(
          children: [
            CustomCachedImage(radius: 24.r, width: 46, height: 46),
            Gap(SpacingHelper.horizontal8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mohammed', style: AppTextTheme.text16W500grey100),
                Gap(SpacingHelper.kVertical4),
                Row(
                  children: [
                    Icon(
                      Icons.phone_android,
                      color: ColorHelper.primaryGreen,
                      size: 18,
                    ),
                    Gap(SpacingHelper.horizontal4),
                    Text('+20092692453', style: AppTextTheme.text14W500grey400),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: ColorHelper.yellow, size: 18),
                    Gap(SpacingHelper.horizontal4),
                    Text('4.8', style: AppTextTheme.text16W500grey100),
                  ],
                ),
                Gap(SpacingHelper.kVertical4),
                Text('(521)', style: AppTextTheme.text14W500grey400),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
