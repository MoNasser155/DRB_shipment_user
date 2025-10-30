import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/enums/state_status.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/widgets/custom_skeletonizer.dart';
import '../../../packages/data/models/packages_model.dart';
import '../cubits/cubit/home_cubit.dart';
import 'incoming_packages_item.dart';

class HomePackagesList extends StatelessWidget {
  const HomePackagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return previous.packagesList != current.packagesList ||
            previous.status != current.status;
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
                      ? PackageModel.skeleton()
                      : state.packagesList[index];

              return CustomSkeletonizer(
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
    );
  }
}
