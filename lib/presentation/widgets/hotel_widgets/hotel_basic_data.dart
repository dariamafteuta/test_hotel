import 'package:flutter/cupertino.dart';
import 'package:test_hotel/presentation/resources/app_colors.dart';
import 'package:test_hotel/presentation/widgets/common/constants.dart';
import 'package:test_hotel/presentation/widgets/common/price_info.dart';

import '../common/hotel_rating_and_address.dart';

class HotelBasicData extends StatelessWidget {
  final String name;
  final String address;
  final int minimalPrice;
  final String priceForIt;
  final double rating;
  final String ratingName;

  const HotelBasicData({
    Key? key,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HotelRatingAndAddress(
              nameHotel: name,
              rating: rating,
              ratingName: ratingName,
              address: address,
            ),
            sizeBoxH16,
            PriceInfo(
              price: minimalPrice,
              priceDescription: priceForIt,
              priceRoom: false,
            ),
          ],
        ),
      ),
    );
  }
}
