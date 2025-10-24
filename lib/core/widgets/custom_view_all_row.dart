import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:flutter/material.dart';

import '../themes/text_theme.dart';

class CustomViewAllRow extends StatelessWidget {
  const CustomViewAllRow({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextTheme.text18W600grey100),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            LocaleKeys.viewAll,
            style: AppTextTheme.underlineText14Primary,
          ),
        ),
      ],
    );
  }
}
