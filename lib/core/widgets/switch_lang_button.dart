import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:drb_shipment_user/core/languages/languages.dart';
import 'package:flutter/material.dart';

class SwitchLangButton extends StatefulWidget {
  const SwitchLangButton({super.key, this.isShorten = false});
  final bool? isShorten;
  @override
  State<SwitchLangButton> createState() => _SwitchLangButtonState();
}

class _SwitchLangButtonState extends State<SwitchLangButton> {
  late Languages _currentLanguage = Languages.currentLanguage;

  @override
  Widget build(BuildContext context) {
    _currentLanguage = Languages.currentLanguage;
    return DropdownButtonHideUnderline(
      child: DropdownButton<Languages>(
        value: _currentLanguage,
        dropdownColor: ColorHelper.grey800,
        borderRadius: BorderRadius.circular(5),
        items:
            Languages.values
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.languageCode == 'en'
                          ? widget.isShorten == false
                              ? 'English'
                              : 'En'
                          : widget.isShorten == false
                          ? 'العربية'
                          : 'عربى',
                      style: TextStyle(color: ColorHelper.grey100),
                    ),
                  ),
                )
                .toList(),
        onChanged: (value) {
          setState(() {
            if (value != null) {
              _currentLanguage = value;
              Languages.setLocaleWithContext(context, value);
            }
          });
        },
      ),
    );
  }
}
