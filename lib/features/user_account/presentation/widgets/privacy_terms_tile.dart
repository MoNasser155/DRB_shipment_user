
import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/themes/text_theme.dart';

class TermsConditionTile extends StatelessWidget {
  const TermsConditionTile(
      {super.key, required this.title, required this.description});
  final String title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style:AppTextTheme.text16W500grey100,
        ),
        Gap(SpacingHelper.kVertical4),
        Text(
          description,
          textAlign: TextAlign.start,
          style: AppTextTheme.text14W500grey400.copyWith(
            color: ColorHelper.grey500,
          ),
        )
      ],
    );
  }
}
