import 'package:drb_shipment_user/core/enums/packages_status.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/languages/local_keys.g.dart';
import '../../../../../core/themes/text_theme.dart';
import '../package_details_row.dart';

class PackageDetailsPackageSection extends StatelessWidget {
  const PackageDetailsPackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingHelper.kVertical8,
      children: [
        Text(LocaleKeys.packageInfo, style: AppTextTheme.text18W600grey100),
        PackageDetailsRow(
          icon: Icons.details_outlined,
          title: LocaleKeys.packageContents,
          data:
              'bla blaaaa blaaaa blllalaaalalalalbla blaaaa blaaaa blllalaaalalalalbla blaaaa blaaaa blllalaaalalalal',
        ),
        PackageDetailsRow(
          icon: Icons.balance_outlined,
          title: LocaleKeys.weight,
          data: '25 kg',
        ),
        PackageDetailsRow(
          icon: Icons.error_outline,
          title: LocaleKeys.status,
          data: PackagesStatus.inProgress.title,
        ),
      ],
    );
  }
}
