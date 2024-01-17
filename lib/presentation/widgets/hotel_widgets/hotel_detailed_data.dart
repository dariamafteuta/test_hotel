import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_hotel/presentation/resources/app_assets.dart';
import 'package:test_hotel/presentation/resources/app_strings.dart';
import 'package:test_hotel/presentation/resources/app_text_styles.dart';
import 'package:test_hotel/presentation/widgets/common/peculiarity_chip.dart';

import '../../resources/app_colors.dart';
import '../common/constants.dart';

class HotelDetailedData extends StatelessWidget {
  final String description;
  final List<String> peculiarities;

  const HotelDetailedData(
      {Key? key, required this.description, required this.peculiarities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.aboutHotels, style: AppTextStyles.black22),
            sizeBoxH16,
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: peculiarities
                  .map(
                    (peculiarity) => PeculiarityChip(peculiarity: peculiarity),
                  )
                  .toList(),
            ),
            sizeBoxH8,
            Text(
              description,
              style: AppTextStyles.black16,
            ),
            sizeBoxH16,
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  _buildListTile(
                    icon: SvgPicture.asset(
                      AppAssets.emojiSquare,
                      height: 24,
                      width: 24,
                    ),
                    title: AppStrings.comfort,
                    subtitle: AppStrings.essentials,
                  ),
                  _buildDivider(context),
                  _buildListTile(
                    icon: SvgPicture.asset(
                      AppAssets.tickSquare,
                      height: 24,
                      width: 24,
                    ),
                    title: AppStrings.enabled,
                    subtitle: AppStrings.essentials,
                  ),
                  _buildDivider(context),
                  _buildListTile(
                    icon: SvgPicture.asset(
                      AppAssets.closeSquare,
                      height: 24,
                      width: 24,
                    ),
                    title: AppStrings.notEnabled,
                    subtitle: AppStrings.essentials,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
      {required SvgPicture icon,
      required String title,
      required String subtitle}) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: AppTextStyles.blackLight16,
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.gray14,
      ),
      trailing: SvgPicture.asset(
        AppAssets.vectorRight,
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.15,
        right: 16,
      ),
      child: const Divider(
        height: 1,
        color: AppColors.grayDivider,
      ),
    );
  }
}
