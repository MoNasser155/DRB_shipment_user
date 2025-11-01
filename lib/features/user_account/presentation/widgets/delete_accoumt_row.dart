import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/color_helper.dart';
import '../../../../core/themes/text_theme.dart';

class DeleteAccountRow extends StatelessWidget {
  const DeleteAccountRow({
    super.key,
    required this.text,
    this.isMultiLines = false,
  });
  final String text;
  final bool isMultiLines;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          isMultiLines ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Gap(8.w),
        Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.only(top: isMultiLines ? 8.h : 0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorHelper.grey500,
          ),
        ),
        Gap(8.w),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: AppTextTheme.text16W500grey100,
          ),
        ),
      ],
    );
  }
}
