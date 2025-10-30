import 'package:drb_shipment_user/core/helpers/spaceing_helper.dart';
import 'package:drb_shipment_user/core/widgets/custom_skeletonizer.dart';
import 'package:drb_shipment_user/features/couriers/presentation/cubits/couriers/couriers_cubit.dart';
import 'package:drb_shipment_user/features/couriers/presentation/widgets/courier_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/color_helper.dart';
import '../../../../core/enums/state_status.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../data/models/couriers_model.dart';

class CouriersBody extends StatelessWidget {
  const CouriersBody({super.key});

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
            title: LocaleKeys.couriers,
            applyPadding: true,
          ),
        ),

        BlocBuilder<CouriersCubit, CouriersState>(
          buildWhen: (previous, current) {
            return previous.couriers != current.couriers;
          },
          builder: (context, state) {
            final length =
                state.status == StateStatus.loading
                    ? 15
                    : state.couriers.length;

            return SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: SpacingHelper.kHorizontalPadding,
                vertical: SpacingHelper.kVertical12,
              ),
              sliver: SliverList.separated(
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
              ),
            );
          },
        ),
      ],
    );
  }
}
