import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/color_helper.dart';

class TabIcon extends StatelessWidget {
  const TabIcon({super.key, required this.icon, required this.isSelected});

  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: isSelected ? 1.2 : 0.9,
      child: SvgPicture.asset(
        icon,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(
          isSelected ? ColorHelper.primaryGreen : ColorHelper.grey100,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
