import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../data/models/courier_model.dart';
import 'courier_image_appbar.dart';
import 'courier_info_card.dart';
import 'vehicle_info_card.dart';

class CourierDetailsBody extends StatelessWidget {
  const CourierDetailsBody({super.key, required this.couriersModel});
  final CourierModel couriersModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorHelper.backgroundBlack,
          automaticallyImplyLeading: false,
          toolbarHeight: 56.h,
          flexibleSpace: CustomAppbar(
            title: LocaleKeys.courierInfo,
            suffix: Container(
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
                style: AppTextTheme.text14W500grey300.copyWith(
                  color: couriersModel.status.color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            applyPadding: true,
          ),
        ),
        CourierImageAppbar(imageUrl: couriersModel.imageUrl),
        SliverGap(SpacingHelper.kVertical12),
        CourierInfoCard(couriersModel: couriersModel),
        SliverGap(SpacingHelper.kVertical12),
        VehicleInfoCard(couriersModel: couriersModel),
      ],
    );
  }
}
