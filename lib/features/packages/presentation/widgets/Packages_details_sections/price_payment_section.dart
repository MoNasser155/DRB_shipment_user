import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/enums/state_status.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../cubits/package_details/package_details_cubit.dart';
import '../custom_package_expansion_tile.dart';
import '../package_details_row.dart';

class PackageDetailsPriceSection extends StatelessWidget {
  const PackageDetailsPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingHelper.kVertical8,
      children: [
        BlocBuilder<PackageDetailsCubit, PackageDetailsState>(
          builder: (context, state) {
            return CustomPackageExpantionTile(
              title: '${LocaleKeys.price} & ${LocaleKeys.payment}',
              isEnabled: state.status == StateStatus.success,

              children: [
                PackageDetailsRow(
                  icon: Icons.attach_money,
                  title: LocaleKeys.paymentMethod,
                  data: state.packagesModel.paymentDetails.paymentMethod.name,
                ),
                Gap(SpacingHelper.kVertical4),
                PackageDetailsRow(
                  icon: Icons.attach_money_outlined,
                  title: LocaleKeys.totalPrice,
                  data: state.packagesModel.price.toString(),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
