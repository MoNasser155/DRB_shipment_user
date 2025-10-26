import 'package:flutter/material.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../package_details_row.dart';

class PackageDetailsRecieverSection extends StatelessWidget {
  const PackageDetailsRecieverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingHelper.kVertical8,
      children: [
        Text(LocaleKeys.receiverInfo, style: AppTextTheme.text18W600grey100),
        PackageDetailsRow(
          icon: Icons.person,
          title: LocaleKeys.name,
          data: 'Mohammed',
        ),
        PackageDetailsRow(
          icon: Icons.phone_android,
          title: LocaleKeys.phoneNumber,
          data: '6549581818',
        ),
         PackageDetailsRow(
          icon: Icons.location_on_outlined,
          title: LocaleKeys.dropoffLocation,
          data: 'data',
        ),
      ],
    );
  }
}