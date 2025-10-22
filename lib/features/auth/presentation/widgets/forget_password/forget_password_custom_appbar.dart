import 'package:flutter/material.dart';
import '../../../../../core/color_helper.dart';
import '../../../../../core/helpers/spaceing_helper.dart';
import '../../../../../core/themes/text_theme.dart';
import '../../../../../core/utils/navigator_helper.dart';

class ForgetPasswordCustomAppbar extends StatelessWidget {
  const ForgetPasswordCustomAppbar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SpacingHelper.kVerticalPadding),
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
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}
