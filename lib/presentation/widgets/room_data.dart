import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_hotel/presentation/resources/app_assets.dart';
import 'package:test_hotel/presentation/resources/app_strings.dart';
import 'package:test_hotel/presentation/screens/reservation_screen.dart';
import 'package:test_hotel/presentation/widgets/common/button_select.dart';
import 'package:test_hotel/presentation/widgets/common/constants.dart';
import 'package:test_hotel/presentation/widgets/common/peculiarity_chip.dart';
import 'package:test_hotel/presentation/widgets/common/price_info.dart';
import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';

class RoomData extends StatelessWidget {
  final String name;
  final List<String> peculiarities;
  final int price;
  final String pricePer;

  const RoomData({
    Key? key,
    required this.name,
    required this.peculiarities,
    required this.price,
    required this.pricePer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 16,
          right: 16,
          left: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.black22,
            ),
            sizeBoxH8,
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: peculiarities
                  .map((peculiarity) => PeculiarityChip(
                        peculiarity: peculiarity,
                      ))
                  .toList(),
            ),
            sizeBoxH8,
            _buildButtonDetailsRoom(),
            sizeBoxH16,
            PriceInfo(
              price: price,
              priceDescription: pricePer,
              priceRoom: true,
            ),
            sizeBoxH16,
            ButtonSelect(
              nameButton: AppStrings.selectedRoom,
              onButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReservationScreen(),
                  ),
                );
              },
              horizontal: 0,
              vertical: 0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonDetailsRoom() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.blueBackground,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              AppStrings.detailsRoom,
              style: AppTextStyles.blue16,
            ),
            sizeBoxW14,
            SvgPicture.asset(
              AppAssets.vectorRight,
              colorFilter: const ColorFilter.mode(
                AppColors.blue,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
