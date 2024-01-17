import 'package:flutter/cupertino.dart';

import '../../../../utils/formatters.dart';
import '../../../resources/app_strings.dart';
import '../../../resources/app_text_styles.dart';

class PaymentItem extends StatelessWidget {
  final String title;
  final int amount;

  const PaymentItem({
    Key? key,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: AppTextStyles.gray16,
          ),
          Text('${PriceFormatter.formatPrice(amount)} ₽',
              style: title == AppStrings.toPay
                  ? AppTextStyles.blue16B
                  : AppTextStyles.black16),
        ],
      ),
    );
  }
}