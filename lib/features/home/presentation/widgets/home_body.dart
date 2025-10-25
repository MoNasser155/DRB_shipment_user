import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:drb_shipment_user/core/widgets/custom_image_carusel.dart';
import 'package:drb_shipment_user/features/home/presentation/widgets/home_custom_appbar.dart';
import 'package:drb_shipment_user/features/home/presentation/widgets/popular_courier_item.dart';
import 'package:drb_shipment_user/features/main_view/presentation/cubits/cubit/main_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/widgets/custom_view_all_row.dart';
import 'custom_home_search.dart';
import 'incoming_packages_item.dart';

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
        CustomHomeSearch(),
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
              onTap: () {
                context.read<MainViewCubit>().setInitialTab(1);
              },
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
        SliverGap(SpacingHelper.kVertical12),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: CustomViewAllRow(
              title: LocaleKeys.popularCouriers,
              onTap: () {},
            ),
          ),
        ),
        SliverGap(SpacingHelper.kVertical12),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 2.8,
              child: ListView.separated(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PopularCourierItem();
                },
                separatorBuilder: (context, index) {
                  return Gap(SpacingHelper.horizontal8);
                },
              ),
            ),
          ),
        ),
        SliverGap(kBottomNavigationBarHeight * 1.7),
      ],
    );
  }
}
