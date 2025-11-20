import 'package:drb_shipment_user/core/extensions/buildcontext_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_helper.dart';
import '../languages/local_keys.g.dart';
import '../themes/text_theme.dart';

class ExpandedDropdown<T> extends StatelessWidget {
  final String hint;
  final List<T> items;
  final String? selectedValue;
  final String Function(T) itemLabelBuilder;
  final ValueChanged<T?>? onChanged;
  final bool isEnabled;
  final int? maxLines;

  const ExpandedDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.itemLabelBuilder,
    this.selectedValue,
    this.onChanged,
    this.isEnabled = true,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorHelper.grey400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorHelper.primaryGreen),
          ),
          labelText: LocaleKeys.select,
          hintText: hint,
          labelStyle: AppTextTheme.text14W500grey300,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorHelper.grey400),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        dropdownColor: ColorHelper.dropMenuColor,
        menuMaxHeight: context.height / 2,
        isExpanded: true,
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        padding: EdgeInsets.zero,
        icon: Transform.rotate(
          angle: 3.14 * 1.5,
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ColorHelper.white,
          ),
        ),
        items:
            items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    itemLabelBuilder(item),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            }).toList(),
        onChanged: isEnabled ? onChanged : null,
        hint:
            selectedValue == null || selectedValue == ''
                ? Text(hint)
                : Text(selectedValue!),
      ),
    );
  }
}
