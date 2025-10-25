import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:drb_shipment_user/core/enums/packages_status.dart';
import 'package:drb_shipment_user/features/packages/presentation/cubits/cubit/packages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/redius_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/themes/text_theme.dart';

class PackagesCustomAppbar extends StatelessWidget {
  const PackagesCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      sliver: SliverAppBar(
        pinned: true,
        floating: true,
        snap: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 48.h,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        flexibleSpace: BlocBuilder<PackagesCubit, PackagesState>(
          buildWhen:
              (previous, current) =>
                  previous.selectedTabIndex != current.selectedTabIndex,
          builder: (context, state) {
            final cubit = PackagesCubit.get(context);
            return Container(
              decoration: BoxDecoration(
                color: ColorHelper.grey100.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(RadiusHelper.kRadius12),
              ),
              child: FlexibleSpaceBar(
                background: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(3, (index) {
                    final bool isSelected = state.selectedTabIndex == index;
                    return InkWell(
                      radius: RadiusHelper.kRadius12,
                      onTap: () => cubit.changeTabIndex(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SpacingHelper.horizontal16,
                          vertical: SpacingHelper.kVertical4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            RadiusHelper.kRadius12,
                          ),
                          color:
                              isSelected
                                  ? PackagesStatus
                                      .values[state.selectedTabIndex]
                                      .color
                                      .withValues(alpha: 0.6)
                                  : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            PackagesStatus.values[index].title,
                            style: AppTextTheme.text18W600grey100.copyWith(
                              fontSize: isSelected ? 18 : 16,
                              color:
                                  isSelected
                                      ? ColorHelper.grey100
                                      : ColorHelper.grey300,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
