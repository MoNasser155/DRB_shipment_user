import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';

class AccountoptionRow extends StatelessWidget {
  const AccountoptionRow({
    super.key,
    required this.option,
    this.optionStyle,
    this.suffixIcon,
    this.prefixIcon,
    required this.withSuffix,
    required this.withPrefix,
    required this.nextScreenRoute,
  });
  final String option;
  final TextStyle? optionStyle;
  final Widget? suffixIcon, prefixIcon;
  final bool withSuffix;
  final bool withPrefix;
  final Function()? nextScreenRoute;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: nextScreenRoute,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            if (withPrefix == true) ...[
              prefixIcon ?? const SizedBox(),
              const Gap(12),
            ],
            Text(option, style: optionStyle ?? AppTextTheme.text16W500grey100),
            const Spacer(),
            withSuffix
                ? suffixIcon ??
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorHelper.primaryGreen,
                      size: 18,
                    )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
