import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:drb_shipment_user/core/extensions/extensions.dart';
import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:drb_shipment_user/features/onboarding/data/models/onbaorging_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem({super.key, required this.onbaordingData});
  final OnbaorgingModel onbaordingData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: context.height * 0.65,
                child: SvgPicture.asset(
                  onbaordingData.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Column(
              children: [
                Gap(context.height * 0.35),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 1.0],
                      colors: [ColorHelper.backgroundBlack, Colors.transparent],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                onbaordingData.title,
                textAlign: TextAlign.center,
                style: AppTextTheme.text28W700White,
              ),
              Gap(12.h),
              Text(
                onbaordingData.body,
                textAlign: TextAlign.center,
                style: AppTextTheme.text16W500grey300,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
