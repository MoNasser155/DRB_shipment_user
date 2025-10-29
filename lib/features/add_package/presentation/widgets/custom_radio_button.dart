
import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:flutter/material.dart';

class CustomRadioButton<T> extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.labelStyle,
  });

  final T value;
  final T? groupValue;
  final Function(T?)? onChanged;
  final String label;
  final TextStyle? labelStyle;

  @override

  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onChanged != null ? () => onChanged!(value) : null,
        child: Row(
          children: [
            Radio<T>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: ColorHelper.primaryGreen,
              fillColor: WidgetStateProperty.all(ColorHelper.primaryGreen),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
            ),
            Text(label, style: labelStyle ?? AppTextTheme.text10W500grey300),
          ],
        ),
      ),
    );
  }
}