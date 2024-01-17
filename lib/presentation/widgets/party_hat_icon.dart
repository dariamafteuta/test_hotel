import 'package:flutter/cupertino.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';

class PartyHatIcon extends StatelessWidget {
  const PartyHatIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      width: 94,
      decoration: const BoxDecoration(
        color: AppColors.blueBackground,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(AppAssets.partyHat),
      ),
    );
  }
}
