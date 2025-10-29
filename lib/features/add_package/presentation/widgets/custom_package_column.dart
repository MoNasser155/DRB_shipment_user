import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/spaceing_helper.dart';

class CustomPackageColumn extends StatelessWidget {
  const CustomPackageColumn({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
        vertical: SpacingHelper.kVerticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        spacing: SpacingHelper.kVertical8,
        children: [...children, Gap(kBottomNavigationBarHeight * 1.7)],
      ),
    );
  }
}
