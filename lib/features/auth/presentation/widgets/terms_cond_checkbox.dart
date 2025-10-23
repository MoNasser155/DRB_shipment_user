import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/languages/local_keys.g.dart';

class TermsCondCheckBox extends StatefulWidget {
  const TermsCondCheckBox({super.key, required this.onChanged});
  final void Function(bool?)? onChanged;
  @override
  State<TermsCondCheckBox> createState() => _TermsCondCheckBoxState();
}

class _TermsCondCheckBoxState extends State<TermsCondCheckBox> {
  bool isChecked = false;
  @override
  void initState() {
    isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 4,
      contentPadding: EdgeInsets.zero,
      leading: Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: const BorderSide(width: 1.5, color: Color(0xffDDDFDF)),
        activeColor: ColorHelper.primaryGreen,
        visualDensity: const VisualDensity(
          vertical: VisualDensity.minimumDensity,
          horizontal: VisualDensity.minimumDensity,
        ),
        value: isChecked,
        onChanged: (value) {
          widget.onChanged?.call(value);
          setState(() {
            isChecked = value!;
          });
        },
      ),
      title: Text.rich(
        TextSpan(
          text: '${LocaleKeys.byCreatingAnAccount}, ',
          style: AppTextTheme.text14W500grey300,
          children: [
            TextSpan(
              text: '${LocaleKeys.youAgreeToOur} ',
              style: AppTextTheme.text14W500grey300,
            ),
            TextSpan(
              text: LocaleKeys.termsAndConditions,
              style: AppTextTheme.nonlineText14Primary,
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
