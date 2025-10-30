import 'package:drb_shipment_user/core/widgets/custom_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/enums/state_status.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/widgets/custom_view_all_row.dart';
import '../../../companies/data/models/company_model.dart';
import '../../../main_view/presentation/cubits/cubit/main_view_cubit.dart';
import '../cubits/cubit/home_cubit.dart';
import 'custom_ads_panner.dart';
import 'custom_home_search.dart';
import 'empty_home_packages_body.dart';
import 'home_custom_appbar.dart';
import 'home_packages_list.dart';
import '../../../companies/presentation/widgets/company_item.dart';

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
            return previous.packagesList != current.packagesList ||
                previous.status != current.status;
          },
          builder: (context, state) {
            if (state.status == StateStatus.success &&
                state.packagesList.isEmpty) {
              return EmptyHomePackagesBody();
            }
            return HomePackagesList();
          },
        ),
        SliverGap(SpacingHelper.kVertical12),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: CustomViewAllRow(
              title: LocaleKeys.popularCompanies,
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
              aspectRatio: 2.95,
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) {
                  return previous.couriersCompany != current.couriersCompany;
                },
                builder: (context, state) {
                  final length =
                      state.status == StateStatus.loading
                          ? 5
                          : state.couriersCompany.length;
                  return ListView.separated(
                    itemCount: length,
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final courierModel =
                          state.status == StateStatus.loading
                              ? CompanyModel.skeleton()
                              : state.couriersCompany[index];
                      return CustomSkeletonizer(
                        enabled: state.status == StateStatus.loading,
                        child: CompanyItem(companyModel: courierModel),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Gap(SpacingHelper.horizontal8);
                    },
                  );
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
