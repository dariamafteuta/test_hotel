import 'package:flutter/cupertino.dart';
import 'package:test_hotel/presentation/widgets/common/constants.dart';

import '../../../utils/formatters.dart';
import '../../resources/app_text_styles.dart';

class PriceInfo extends StatelessWidget {
  final int price;
  final String priceDescription;
  final bool priceRoom;

  const PriceInfo({
    Key? key,
    required this.price,
    required this.priceDescription,
    required this.priceRoom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          priceRoom
              ? '${PriceFormatter.formatPrice(price)} ₽'
              : 'от ${PriceFormatter.formatPrice(price)} ₽',
          style: AppTextStyles.black30,
        ),
        sizeBoxW8,
        Text(
          priceDescription.toLowerCase(),
          style: AppTextStyles.gray16,
        ),
      ],
    );
  }
}
