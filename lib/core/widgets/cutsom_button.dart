import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonChild,
      required this.onTap,
      this.buttonWidth = double.infinity,
      this.buttonPadding,
      this.heightPercent,
      this.backgroundColor,
      this.borderColor,
      this.raduis});
  final Widget buttonChild;
  final VoidCallback? onTap;
  final double buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final double? heightPercent, raduis;
  final Color? backgroundColor, borderColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: borderColor ?? backgroundColor ?? ColorHelper.primaryGreen),
            borderRadius: BorderRadius.circular(raduis ?? 8),
            color: backgroundColor ?? ColorHelper.primaryGreen),
        margin: buttonPadding,
        width: buttonWidth,
        height: context.height / 16,
        alignment: Alignment.center,
        child: Center(child: buttonChild),
      ),
    );
  }
}
