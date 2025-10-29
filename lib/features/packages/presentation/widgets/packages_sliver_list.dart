import 'package:drb_shipment_user/features/packages/data/models/packages_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/enums/state_status.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/widgets/custom_skeletonizer.dart';
import '../cubits/Packages/packages_cubit.dart';
import 'packages_item.dart';

class PackagesSliverList extends StatelessWidget {
  const PackagesSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesCubit, PackagesState>(
      buildWhen: (previous, current) {
        return previous.packages != current.packages;
      },
      builder: (context, state) {
        final length =
            state.status == StateStatus.loading ? 15 : state.packages.length;
        return SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingHelper.kHorizontalPadding,
          ),
          sliver: SliverList.separated(
            itemBuilder: (context, index) {
              final package =
                  state.status == StateStatus.loading
                      ? PackagesModel.skeleton()
                      : state.packages[index];
              return CustomSkeletonizer(
                enabled: state.status == StateStatus.loading,
                child: PackagesItem(packageData: package),
              );
            },
            separatorBuilder: (context, index) {
              return Gap(SpacingHelper.kVertical12);
            },
            itemCount: length,
          ),
        );
      },
    );
  }
}
