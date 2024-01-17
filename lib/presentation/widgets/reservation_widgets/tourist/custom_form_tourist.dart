import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';

class CustomFormTourist extends StatefulWidget {
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String Function(String?) validator;

  const CustomFormTourist({
    Key? key,
    required this.labelText,
    required this.keyboardType,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  _CustomFormTouristState createState() => _CustomFormTouristState();
}

class _CustomFormTouristState extends State<CustomFormTourist> {
  final FocusNode _focusNode = FocusNode();
  String? _labelText;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_updateLabel);
    _labelText = widget.labelText;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _updateLabel() {
    String newText;
    if (_focusNode.hasFocus) {
      newText = '\n${widget.labelText}';
    } else {
      newText = widget.labelText;
    }

    if (newText != _labelText) {
      setState(() {
        _labelText = newText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      style: AppTextStyles.blackForm16,
      cursorColor: AppColors.blackForm,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        labelText: _labelText,
        labelStyle: AppTextStyles.grayForm16,
        filled: true,
        fillColor: AppColors.background,
      ),
    );
  }
}
