import 'package:flutter/material.dart';
import '../color_helper.dart';
import '../helpers/spaceing_helper.dart';
import '../themes/text_theme.dart';
import '../utils/navigator_helper.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.suffix,
    this.applyPadding = false,
  });
  final String title;
  final Widget? suffix;
  final bool? applyPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SpacingHelper.kVerticalPadding,
        horizontal: applyPadding == true ? SpacingHelper.kHorizontalPadding : 0,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              AppNavigator.pop();
            },
            child: const Icon(Icons.arrow_back_ios, color: ColorHelper.grey100),
          ),
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextTheme.appBarTitle,
          ),
          const Spacer(),
          suffix ?? const SizedBox(width: 24),
        ],
      ),
    );
  }
}
