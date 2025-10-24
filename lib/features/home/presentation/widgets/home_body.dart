import 'package:cached_network_image/cached_network_image.dart';
import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:drb_shipment_user/core/widgets/custom_image_carusel.dart';
import 'package:drb_shipment_user/features/home/presentation/widgets/home_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/widgets/custom_view_all_row.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        SliverGap(SpacingHelper.kVertical12),
        HomeCustomAppbar(),
        SliverGap(SpacingHelper.kVertical12),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: CustomImageCarousel(
              images: [
                "https://i.pinimg.com/736x/d3/e7/0d/d3e70d89e5bfbe3b18c4ccdb6901d7df.jpg",
                "https://i.pinimg.com/736x/d3/e7/0d/d3e70d89e5bfbe3b18c4ccdb6901d7df.jpg",
                "https://i.pinimg.com/736x/d3/e7/0d/d3e70d89e5bfbe3b18c4ccdb6901d7df.jpg",
              ],
              title: "Discount",
              subtitle:
                  "30% off on all products\nup to 50% off on selected products",
              borderRadius: BorderRadius.circular(RadiusHelper.kRadius16),
            ),
          ),
        ),
        SliverGap(SpacingHelper.kVertical12),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: CustomViewAllRow(
              title: LocaleKeys.incomingPackages,
              onTap: () {},
            ),
          ),
        ),
        SliverGap(SpacingHelper.kVertical8),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverList.separated(
            itemCount: 3,
            itemBuilder: (context, index) {
              return IncomingPackagesItem();
            },
            separatorBuilder: (context, index) {
              return Gap(SpacingHelper.kVertical8);
            },
          ),
        ),
      ],
    );
  }
}

class IncomingPackagesItem extends StatelessWidget {
  const IncomingPackagesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text("#123456", style: AppTextTheme.text16W500grey300),
            ],
          ),
          Spacer(),
          Text('On the way', style: AppTextTheme.nonlineText14Primary),
          Gap(SpacingHelper.horizontal8),
        ],
      ),
    );
  }
}
