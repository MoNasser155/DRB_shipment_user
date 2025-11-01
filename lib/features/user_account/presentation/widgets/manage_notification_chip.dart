import 'package:flutter/material.dart';
import '../../../../core/helpers/spaceing_helper.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../../../core/themes/text_theme.dart';
import '../../../../core/widgets/custom_toggle_switch.dart';

class ManageNotificationChip extends StatefulWidget {
  const ManageNotificationChip({super.key});

  @override
  State<ManageNotificationChip> createState() => _ManageNotificationChipState();
}

class _ManageNotificationChipState extends State<ManageNotificationChip> {
  bool isAcitivated = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingHelper.kHorizontalPadding,
      ),
      child: Row(
        children: [
          Text(LocaleKeys.notifications, style: AppTextTheme.text16W500grey100),
          Spacer(),
          CustomToggle(
            initialValue: isAcitivated,
            onChanged: (value) {
              setState(() {
                isAcitivated = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
