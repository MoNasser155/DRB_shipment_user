import 'package:drb_shipment_user/core/enums/packages_status.dart';
import 'package:drb_shipment_user/features/packages/presentation/cubits/package_details/package_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../custom_package_expansion_tile.dart';
import '../package_details_row.dart';

class PackageDetailsPackageSection extends StatelessWidget {
  const PackageDetailsPackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingHelper.kVertical8,
      children: [
        BlocBuilder<PackageDetailsCubit, PackageDetailsState>(
          buildWhen: (previous, current) {
            return previous.packagesModel != current.packagesModel;
          },
          builder: (context, state) {
            return CustomPackageExpantionTile(
              title: LocaleKeys.packageInfo,
              isEnabled: true,
              isExpanded: true,
              children: [
                PackageDetailsRow(
                  icon: Icons.details_outlined,
                  title: LocaleKeys.packageContents,
                  data: state.packagesModel.packageContent,
                ),
                Gap(SpacingHelper.kVertical4),
                PackageDetailsRow(
                  icon: Icons.balance_outlined,
                  title: LocaleKeys.weight,
                  data: state.packagesModel.weight.toString(),
                ),
                Gap(SpacingHelper.kVertical4),
                PackageDetailsRow(
                  icon: Icons.error_outline,
                  title: LocaleKeys.status,
                  data: PackagesStatus.inProgress.title,
                ),
                Gap(SpacingHelper.kVertical4),
                PackageDetailsRow(
                  icon: Icons.dangerous,
                  title: LocaleKeys.fragile,
                  data:
                      state.packagesModel.isFragile
                          ? LocaleKeys.yes
                          : LocaleKeys.no,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
