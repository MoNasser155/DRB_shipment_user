import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:flutter/material.dart';


class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
    this.activeColor,
    this.inactiveColor,
    this.activeDotWidth = 24.0,
    this.dotWidth = 8.0,
    this.dotHeight = 8.0,
    this.spacing = 4.0,
  });

  final int currentIndex;
  final int count;
  final Color? activeColor;
  final Color? inactiveColor;
  final double activeDotWidth;
  final double dotWidth;
  final double dotHeight;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: spacing),
          width: index == currentIndex ? activeDotWidth : dotWidth,
          height: dotHeight,
          decoration: BoxDecoration(
            color:
                index == currentIndex
                    ? activeColor ?? ColorHelper.primaryGreen
                    : inactiveColor ?? ColorHelper.grey200,
            borderRadius: BorderRadius.circular(dotHeight / 2),
          ),
        ),
      ),
    );
  }
}