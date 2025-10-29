import 'package:drb_shipment_user/features/home/presentation/cubits/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/enums/state_status.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/widgets/custom_view_all_row.dart';
import '../../../main_view/presentation/cubits/cubit/main_view_cubit.dart';
import '../../../packages/data/models/packages_model.dart';
import 'custom_ads_panner.dart';
import 'custom_home_search.dart';
import 'home_custom_appbar.dart';
import 'incoming_packages_item.dart';
import 'popular_courier_item.dart';

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
        CustomAdsPanner(),
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
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) {
            return previous.packagesList != current.packagesList;
          },
          builder: (context, state) {
            return SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: SpacingHelper.kHorizontalPadding,
              ),
              sliver: SliverList.separated(
                itemCount:
                    state.status == StateStatus.loading
                        ? 3
                        : state.packagesList.length,
                itemBuilder: (context, index) {
                  final packagesModel =
                      state.status == StateStatus.loading
                          ? PackagesModel.skeleton()
                          : state.packagesList[index];
                  return Skeletonizer(
                    containersColor: ColorHelper.grey100.withValues(
                      alpha: 0.05,
                    ),
                    enabled: state.status == StateStatus.loading,
                    child: IncomingPackagesItem(packagesModel: packagesModel),
                  );
                },
                separatorBuilder: (context, index) {
                  return Gap(SpacingHelper.kVertical8);
                },
              ),
            );
          },
        ),
        SliverGap(SpacingHelper.kVertical12),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: CustomViewAllRow(
              title: LocaleKeys.popularCouriers,
              onTap: () {
                context.read<MainViewCubit>().setInitialTab(3);
              },
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
