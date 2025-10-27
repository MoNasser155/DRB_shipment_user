import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/themes/text_theme.dart';

class PackageDetailsRow extends StatelessWidget {
  const PackageDetailsRow({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });
  final IconData icon;
  final String title, data;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(icon, color: ColorHelper.primaryGreen, size: 20),
        Gap(SpacingHelper.horizontal4),
        Text('$title:', style: AppTextTheme.text16W500grey100),
        Gap(SpacingHelper.horizontal4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(2),
              Text(
                data,
                style: AppTextTheme.text14W500grey400,

                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
