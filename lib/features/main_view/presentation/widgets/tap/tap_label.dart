import 'package:flutter/material.dart';

import '../../../../../core/themes/text_theme.dart';

class TabLabel extends StatelessWidget {
  const TabLabel({super.key, required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style:
          isSelected ? AppTextTheme.selectedTap : AppTextTheme.nonSelectedTap,
    );
  }
}
