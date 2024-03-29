import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_text_styles.dart';

class CustomFormInfo extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?) validator;

  const CustomFormInfo({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  _CustomFormInfoState createState() => _CustomFormInfoState();
}

class _CustomFormInfoState extends State<CustomFormInfo> {
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
    if (_focusNode.hasFocus || widget.controller.text.isNotEmpty) {
      newText = '\n${widget.labelText}';
    } else {
      newText = widget.labelText;
    }

    if (newText
        != _labelText) {
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
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        labelText: _labelText,
        labelStyle: AppTextStyles.grayForm16,
        hintText: widget.hintText,
        hintStyle: AppTextStyles.blackForm16,
        filled: true,
        fillColor: AppColors.background,
      ),
    );
  }
}