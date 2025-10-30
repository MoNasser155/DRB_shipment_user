import 'package:drb_shipment_user/core/app_assets/icons.dart';
import 'package:drb_shipment_user/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';

class CustomHomeSearch extends StatelessWidget {
  const CustomHomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingHelper.kHorizontalPadding,
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomTextField(
                enabeledBorder: Colors.transparent,
                fillColor: ColorHelper.grey100.withValues(alpha: 0.05),
                suffix: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SpacingHelper.horizontal4,
                    vertical: SpacingHelper.kVertical4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(RadiusHelper.kRadius4),
                    color: ColorHelper.grey100.withValues(alpha: 0.05),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.scanner,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      ColorHelper.primaryGreen,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                prefix: const Icon(Icons.search),
                hint: "${LocaleKeys.search}...",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
