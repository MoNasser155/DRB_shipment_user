import 'package:drb_shipment_user/core/widgets/custom_skeletonizer.dart';
import 'package:drb_shipment_user/features/companies/presentation/cubits/company_details/company_details_cubit.dart';
import 'package:drb_shipment_user/features/couriers/data/models/courier_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/enums/state_status.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/utils/navigator_helper.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_view_all_row.dart';
import '../../../couriers/presentation/screens/couriers_screen.dart';
import '../../../couriers/presentation/widgets/courier_card_item.dart';
import 'sections/company_image_appbar.dart';
import 'sections/company_info_section.dart';
import 'sections/description_section.dart';
import 'sections/location_section.dart';

class CompanyDetailsBody extends StatelessWidget {
  const CompanyDetailsBody({super.key});

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
            title: LocaleKeys.companyInfo,
            applyPadding: true,
          ),
        ),
        CompanyImageAppbar(),
        SliverGap(SpacingHelper.kVertical12),
        CompanyInfoSection(),
        SliverGap(SpacingHelper.kVertical12),
        DescriptionSection(),
        SliverGap(SpacingHelper.kVertical12),
        CompanyLocationSection(),
        SliverGap(SpacingHelper.kVertical12),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: CustomViewAllRow(
              title: LocaleKeys.popularCouriers,
              onTap: () {
                AppNavigator.push(
                  transitionBuilder: AppNavigator.cupertinoTransition,
                  screen: CouriersScreen(
                    companyId:
                        context
                            .read<CompanyDetailsCubit>()
                            .state
                            .companyModel
                            .id,
                  ),
                );
              },
            ),
          ),
        ),
        SliverGap(SpacingHelper.kVertical12),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(
            buildWhen: (previous, current) {
              return previous.couriers != current.couriers;
            },
            builder: (context, state) {
              final length =
                  state.status == StateStatus.loading
                      ? 3
                      : state.couriers.length;

              return SliverList.separated(
                itemBuilder: (context, index) {
                  final courier =
                      state.status == StateStatus.loading
                          ? CourierModel.skeleton()
                          : state.couriers[index];
                  return CustomSkeletonizer(
                    enabled: state.status == StateStatus.loading,
                    child: CourierCardItem(couriersModel: courier),
                  );
                },
                separatorBuilder: (context, index) {
                  return Gap(SpacingHelper.kVertical12);
                },
                itemCount: length,
              );
            },
          ),
        ),
        SliverGap(SpacingHelper.kVertical12),
      ],
    );
  }
}
