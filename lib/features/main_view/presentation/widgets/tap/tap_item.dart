import 'package:flutter/material.dart';

import '../../../../../core/color_helper.dart';
import '../../../data/models/bottom_sheet_model.dart';
import 'tap_icon.dart';
import 'tap_label.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.index,
    required this.config,
    required this.isSelected,
    required this.onTap,
  });

  final int index;
  final BottomSheetModel config;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      splashColor: ColorHelper.grey200.withValues(alpha: 0.2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(width: isSelected ? 60 : 0, height: isSelected ? 44 : 0),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabIcon(
                  icon: config.icon,
                  isSelected: isSelected,
                  
                ),
                const SizedBox(height: 4),
                TabLabel(
                  label: config.label,
                  isSelected: isSelected,
                
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
