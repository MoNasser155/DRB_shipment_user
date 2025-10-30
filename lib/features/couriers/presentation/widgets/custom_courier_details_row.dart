
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/themes/text_theme.dart';

class CustomCourierDetailsRow extends StatelessWidget {
  const CustomCourierDetailsRow({
    super.key,
    required this.title,
    required this.subTitle,
    this.children,
  });

  final String title, subTitle;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextTheme.text16W500grey100),
        Gap(SpacingHelper.horizontal4),
        Text(subTitle, style: AppTextTheme.text16W500grey300),
        ...children ?? [],
      ],
    );
  }
}
