// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../core/widgets/textfield_withlabel.dart';

class PassFieldWithLabel extends StatefulWidget {
  const PassFieldWithLabel({
    super.key,
    required this.label,
    this.hint,
    this.validate,
    this.controller,
     this.removeInit = false,
  });
  final String label;
  final String? hint;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  final bool removeInit;

  @override
  State<PassFieldWithLabel> createState() => _PassFieldWithLabelState();
}

class _PassFieldWithLabelState extends State<PassFieldWithLabel> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldWithLabel(
      hint: widget.hint,
      removeInit: widget.removeInit,
      controller: widget.controller,
      maxLines: 1,
      validate: widget.validate,
      hidden: hidden,
      inputType: TextInputType.visiblePassword,
      label: widget.label,
      suffix: IconButton(
        onPressed: () {
          setState(() {
            hidden = !hidden;
          });
        },
        icon:
            hidden
                ? Icon(Icons.visibility_outlined, color: Colors.grey)
                : Icon(Icons.visibility_off_outlined, color: Colors.grey),
      ),
    );
  }
}
