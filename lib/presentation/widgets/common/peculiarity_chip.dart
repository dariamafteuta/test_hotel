import 'package:flutter/cupertino.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_text_styles.dart';

class PeculiarityChip extends StatelessWidget {
  final String peculiarity;

  const PeculiarityChip({
    Key? key,
    required this.peculiarity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        peculiarity,
        style: AppTextStyles.gray16B,
      ),
    );
  }
}