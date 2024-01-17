import 'package:flutter/cupertino.dart';
import 'package:test_hotel/presentation/resources/app_text_styles.dart';

import '../../resources/app_colors.dart';

class ButtonSelect extends StatelessWidget {
  final String nameButton;
  final VoidCallback onButtonPressed;
  final double horizontal;
  final double vertical;

  const ButtonSelect({
    Key? key,
    required this.nameButton,
    required this.onButtonPressed,
    required this.horizontal,
    required this.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: CupertinoButton(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(15),
          onPressed: onButtonPressed,
          child: Text(
            nameButton,
            style: AppTextStyles.white16,
          ),
        ),
      ),
    );
  }
}
