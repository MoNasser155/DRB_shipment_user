import 'package:drb_shipment_user/features/packages/presentation/cubits/package_details/package_details_cubit.dart';
import 'package:drb_shipment_user/features/packages/presentation/widgets/custom_package_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../package_details_row.dart';

class PackageDetailsRecieverSection extends StatelessWidget {
  const PackageDetailsRecieverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingHelper.kVertical8,
      children: [
        BlocBuilder<PackageDetailsCubit, PackageDetailsState>(
          builder: (context, state) {
            return CustomPackageExpantionTile(
              title: LocaleKeys.receiverInfo,
              isEnabled: true,
              children: [
                PackageDetailsRow(
                  icon: Icons.person,
                  title: LocaleKeys.name,
                  data: state.packagesModel.receiverInfo.name,
                ),
                Gap(SpacingHelper.kVertical4),
                PackageDetailsRow(
                  icon: Icons.phone_android,
                  title: LocaleKeys.phoneNumber,
                  data: state.packagesModel.receiverInfo.phone,
                ),
                Gap(SpacingHelper.kVertical4),
                PackageDetailsRow(
                  icon: Icons.email,
                  title: LocaleKeys.email,
                  data: state.packagesModel.receiverInfo.email,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
