import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../cubits/package_details/package_details_cubit.dart';
import '../custom_package_expansion_tile.dart';
import '../package_details_row.dart';

class PackageDetailsSenderSection extends StatelessWidget {
  const PackageDetailsSenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingHelper.kVertical8,
      children: [
        BlocBuilder<PackageDetailsCubit, PackageDetailsState>(
          builder: (context, state) {
            return CustomPackageExpantionTile(
              title: LocaleKeys.senderInfo,
              isEnabled: state.status == StateStatus.success,
              isExpanded: false,
              children: [
                PackageDetailsRow(
                  icon: Icons.person,
                  title: LocaleKeys.name,
                  data: state.user.usreName,
                ),
                Gap(SpacingHelper.kVertical4),
                PackageDetailsRow(
                  icon: Icons.phone_android,
                  title: LocaleKeys.phoneNumber,
                  data: state.user.phone,
                ),
                Gap(SpacingHelper.kVertical4),

                PackageDetailsRow(
                  icon: Icons.email,
                  title: LocaleKeys.email,
                  data: state.user.email,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
