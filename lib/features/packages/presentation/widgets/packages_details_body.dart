import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:drb_shipment_user/core/widgets/custom_appbar.dart';
import 'package:drb_shipment_user/features/packages/presentation/widgets/Packages_details_sections/location_section.dart';
import 'package:drb_shipment_user/features/packages/presentation/widgets/Packages_details_sections/package_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import 'Packages_details_sections/couriers_section.dart';
import 'Packages_details_sections/price_payment_section.dart';
import 'Packages_details_sections/reciever_section.dart';
import 'Packages_details_sections/sender_section.dart';

class PackagesDetailsBody extends StatelessWidget {
  const PackagesDetailsBody({super.key});

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
            title: LocaleKeys.packageDetails,
            applyPadding: true,
          ),
        ),
        SliverAppBar(
          pinned: true,
          floating: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          shadowColor: ColorHelper.grey100,

          scrolledUnderElevation: 10,

          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorHelper.backgroundBlack,
          automaticallyImplyLeading: false,
          toolbarHeight: context.height * 0.3,
          flexibleSpace: PackageDetailsLocationSection(),
        ),
        SliverGap(SpacingHelper.kVertical12),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SpacingHelper.kHorizontalPadding,
            ),
            child: Column(
              spacing: SpacingHelper.kVertical12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PackageDetailsPackageSection(),
                PackageDetailsSenderSection(),
                PackageDetailsRecieverSection(),
                PackageDetailsPriceSection(),
                PackageDetailsCourierSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
