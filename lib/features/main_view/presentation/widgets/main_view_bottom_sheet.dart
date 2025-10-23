import 'package:flutter/material.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import 'custom_tap_bar.dart';

class MainViewBottomSheet extends StatelessWidget {
  const MainViewBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.only(left: SpacingHelper.horizontal16, right: SpacingHelper.horizontal16, bottom: SpacingHelper.kVertical12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          decoration: BoxDecoration(
            color: ColorHelper.grey600,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.grey.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: const CustomTabBar(),
        ),
      ),
    );
  }
}