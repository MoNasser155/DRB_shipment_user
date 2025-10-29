import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import 'custom_tap_bar.dart';

class MainViewBottomSheet extends StatelessWidget {
  const MainViewBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.0, 0.4],
          colors: [
            ColorHelper.backgroundBlack.withValues(alpha: 0.8),
            Colors.transparent,
          ],
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: SpacingHelper.kHorizontalPadding,
          right: SpacingHelper.kHorizontalPadding,
          bottom: SpacingHelper.kVertical12,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            decoration: BoxDecoration(
              color: ColorHelper.grey800.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const CustomTabBar(),
            ),
          ),
        ),
      ),
    );
  }
}
