import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_hotel/presentation/widgets/common/constants.dart';

import '../../resources/app_assets.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_text_styles.dart';

class HotelRatingAndAddress extends StatelessWidget {
  final String nameHotel;
  final double rating;
  final String ratingName;
  final String address;

  const HotelRatingAndAddress({
    Key? key,
    required this.rating,
    required this.ratingName,
    required this.address,
    required this.nameHotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRating(),
        sizeBoxH8,
        Text(
          nameHotel,
          style: AppTextStyles.black22,
        ),
        _buildAddressButton(context),
      ],
    );
  }

  Widget _buildRating() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.orangeBackground,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppAssets.star,
            colorFilter:
                const ColorFilter.mode(AppColors.orange, BlendMode.srcIn),
          ),
          sizeBoxW2,
          Text(
            rating.round().toString(),
            style: AppTextStyles.orange16,
          ),
          sizeBoxW2,
          Text(
            ratingName,
            style: AppTextStyles.orange16,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressButton(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Text(
        address,
        style: AppTextStyles.blue14,
      ),
      onPressed: () {},
    );
  }
}
