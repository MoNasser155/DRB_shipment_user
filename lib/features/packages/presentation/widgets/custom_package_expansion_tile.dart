import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/themes/text_theme.dart';

class CustomPackageExpantionTile extends StatelessWidget {
  const CustomPackageExpantionTile({
    super.key,
    required this.title,
    required this.children,
    this.isExpanded = false,
    required this.isEnabled,
  });
  final List<Widget> children;
  final String title;
  final bool isExpanded, isEnabled;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(color: ColorHelper.secondryOrange),
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: ColorHelper.grey100.withValues(alpha: 0.05),
      collapsedIconColor: ColorHelper.secondryOrange,
      iconColor: ColorHelper.primaryGreen,
      enabled: isEnabled,
      initiallyExpanded: isExpanded,
      tilePadding: EdgeInsets.symmetric(
        horizontal: SpacingHelper.horizontal8,
        vertical: SpacingHelper.kVertical4,
      ),
      visualDensity: VisualDensity(
        vertical: VisualDensity.minimumDensity,
        horizontal: VisualDensity.minimumDensity,
      ),

      childrenPadding: EdgeInsets.only(
        left: SpacingHelper.horizontal12,
        right: SpacingHelper.horizontal12,
        top: SpacingHelper.kVertical8,
      ),

      title: Text(title, style: AppTextTheme.text18W600grey100),
      children: [
        Divider(
          color: ColorHelper.primaryGreen,
          thickness: 1,
          endIndent: SpacingHelper.horizontal20,
          indent: SpacingHelper.horizontal20,
          height: 0,
        ),
        Gap(SpacingHelper.kVertical12),
        ...children,
        Gap(SpacingHelper.kVertical12),
      ],
    );
  }
}
