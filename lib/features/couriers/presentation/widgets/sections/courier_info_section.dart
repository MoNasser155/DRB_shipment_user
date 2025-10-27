import 'dart:ui';

import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/color_helper.dart';
import '../../../../../core/helpers/redius_helper.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../../core/widgets/custom_cached_image.dart';

class CourierInfoSection extends StatelessWidget {
  const CourierInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          CustomCachedImage(
            height: context.height * 0.3,
            radius: 0,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.height * 0.265,
              left: SpacingHelper.kHorizontalPadding,
              right: SpacingHelper.kHorizontalPadding,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorHelper.grey100.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(RadiusHelper.kRadius8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Mohammed Ali',
                            style: AppTextTheme.text16W500grey100,
                          ),
                          Spacer(),
                          Text(
                            '4.5',
                            style: AppTextTheme.text14W500grey300.copyWith(
                              color: ColorHelper.grey100,
                            ),
                          ),
                          Gap(SpacingHelper.horizontal4),
                          Icon(Icons.star, color: ColorHelper.yellow, size: 16),
                        ],
                      ),
                      Gap(SpacingHelper.kVertical4),
                      Row(
                        children: [
                          Text(
                            '${LocaleKeys.driverLicense}:',
                            style: AppTextTheme.text14W500grey300,
                          ),
                          Gap(SpacingHelper.horizontal4),
                          Text('123456', style: AppTextTheme.text14W500grey300),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
